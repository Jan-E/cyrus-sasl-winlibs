/* SRP SASL plugin
 * Ken Murchison
 * Tim Martin  3/17/00
 * $Id: srp.c,v 1.59 2010/11/30 11:41:47 mel Exp $
 */
/* 
 * Copyright (c) 1998-2003 Carnegie Mellon University.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The name "Carnegie Mellon University" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For permission or any other legal
 *    details, please contact  
 *      Office of Technology Transfer
 *      Carnegie Mellon University
 *      5000 Forbes Avenue
 *      Pittsburgh, PA  15213-3890
 *      (412) 268-4387, fax: (412) 268-7395
 *      tech-transfer@andrew.cmu.edu
 *
 * 4. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by Computing Services
 *     at Carnegie Mellon University (http://www.cmu.edu/computing/)."
 *
 * CARNEGIE MELLON UNIVERSITY DISCLAIMS ALL WARRANTIES WITH REGARD TO
 * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS, IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY BE LIABLE
 * FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
 * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
 * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*
 * Notes:
 *
 * - The authentication exchanges *should* be correct (per draft -08)
 *   but we won't know until we do some interop testing.
 *
 * - The security layers don't conform to draft -08:
 *    o  We don't use eos() and os() elements in an SRP buffer, we send
 *      just the bare octets.
 *    o  We don't yet use the PRNG() and KDF() primatives described in
 *       section 5.1.
 *
 * - Are we using cIV and sIV correctly for encrypt/decrypt?
 *
 * - We don't implement fast reauth.
 */

int srp_server_plug_init(const sasl_utils_t *utils,
			 int maxversion,
			 int *out_version,
			 const sasl_server_plug_t **pluglist,
			 int *plugcount,
			 const char *plugname __attribute__((unused)))
{
	return SASL_NOMECH;
}

int srp_client_plug_init(const sasl_utils_t *utils __attribute__((unused)),
			 int maxversion,
			 int *out_version,
			 const sasl_client_plug_t **pluglist,
			 int *plugcount,
			 const char *plugname __attribute__((unused)))
{
	return SASL_NOMECH;
}

int gssapiv2_server_plug_init(
#ifndef HAVE_GSSKRB5_REGISTER_ACCEPTOR_IDENTITY
    const sasl_utils_t *utils __attribute__((unused)),
#else
    const sasl_utils_t *utils,
#endif 
    int maxversion,
    int *out_version,
    sasl_server_plug_t **pluglist,
    int *plugcount)
{
	return SASL_NOMECH;
}

int gssapiv2_client_plug_init(const sasl_utils_t *utils __attribute__((unused)), 
			      int maxversion,
			      int *out_version, 
			      sasl_client_plug_t **pluglist,
			      int *plugcount)
{
	return SASL_NOMECH;
}

int sasldb_auxprop_plug_init(const sasl_utils_t *utils,
                             int max_version,
                             int *out_version,
                             sasl_auxprop_plug_t **plug,
                             const char *plugname __attribute__((unused))) 
{
	return SASL_NOMECH;
}

