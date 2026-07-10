Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020128.outbound.protection.outlook.com [52.101.196.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486AB364943;
	Fri, 10 Jul 2026 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700485; cv=fail; b=bWE2lqxcpOeY/dZnDkl8D9gMrqb+MKqIGAB5b6k8ItMVlPylQIGZnPJV7npDYIgXWTO0fBqOGNodum5STF+l0BK7wWqLqBU+r5bWBv1peq9kctVI+u0be4Zrnip2PZb+5alBbSnnkdHMTB3C7Kz/xlqjUH9ZD7eLc8UUrYFXn3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700485; c=relaxed/simple;
	bh=0LDgQyBlvOotDUTycHAaNvpyUZn+iAPYLK0dma8PBbE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OjwIWRXdgYv8B54SPpX4/EnkZ4AP6PvqbZA4+aBijnBvgXEfARDA8A8EfQPlXSGUvYHMRz2kpXtBD5E6/ek+u/+RIq6QI1PqzlYFf9vrCFioIEAXG32L6kiNYo5GBACSM6Zp4X9xeYkgFAeKzc4YiSs5UfV/aaijDmo2onfZdoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jhZUtqfZ; arc=fail smtp.client-ip=52.101.196.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jhZUtqfZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y19wnmmHyt2Cx6JF7ck0MsviW3jiiL05B7ISq9Gx2dVVhYBrOjPTGsk/aN3l+u2EwaBNuwaYBbNlc8sK0Kq53PdYmxgSZOnTDlcvn5Gaw3EnmgiionNg1kJhcWLw8xkz52DSJMD1CzXXBxwJkYCIzivh55H5BxTSxrVPRVNPV47kC0RIJksy9e25mfJJx/dgyHHx5avVHvFh1QbJMafmY6+QnT+babM2KNim1kKBzDyvImcERv+i4eadv5Mb5fk0g1uOk+OjWr+8MwcWqpn4Zxdgd8tn1ub6EcGH9uJKkcNNDW5ZvKePGJPEakfCwLhQ0DKg9ST70JHP0CYE9GmFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNPU6gU6xl3RwMeb2LPrAFMY78v9cEj3S8dCa5mGgjA=;
 b=cwvViLjbeg8rFoPcctZhfA1jPzeLmuKGrwUvj3XfLraXSPeJcWGUzVBAnQll/0P8DcTWmjz4DlfCmpKiR7SksriIeM9eAXDYUXhqQsegm4N/Frph1VZhP7MgHDzXIsmoBbZYFs+lJ3InxOiUdT/sAD9SlwLehbjVLfgoW9R9jlto9SAshaGhebDj8BWjkT6T07QaJThOu228zOY8XUsISEBHg9BZ7R1GkJ64JBnXSxCdAleESCIqsuKNhYL9DoFtA322RKriu+wDU+vw3ObPbxZW4VyrF8apg7dKrPEJq89fhb2NrEFR6ks6jihE0m8PHnFY0FZv7tOUWYQ6/n93Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNPU6gU6xl3RwMeb2LPrAFMY78v9cEj3S8dCa5mGgjA=;
 b=jhZUtqfZKAhp2OOYLeU11EmDZQVeu9myFpxvaSl52WM9l4+0IbF+WoGzdQax3A3kwYPAgOtOnD9m+jD3gyqCKpn1TIbQXiXLQuyznkBAm7DstF70EZ81/RgqfnARceNmXj86WPeOaH78gLPnH0LD/zjzYY0WDcQD6hdM9AeVrh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:51 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 10 Jul 2026 17:20:35 +0100
Subject: [PATCH 5/7] rust: pin-init: internal: generate brace in macro for
 init code blocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-pin-init-sync-v1-5-8fa16cde87ae@garyguo.net>
References: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
In-Reply-To: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=1429;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=0LDgQyBlvOotDUTycHAaNvpyUZn+iAPYLK0dma8PBbE=;
 b=/BkEI4Kgf6YN+FKU9/SwtuRWbEfFhP1E6w+lMcwLshylfd4RTqyFcdJqkchcoHxuf/LsjkJxW
 Qt1W3PEbU6rCvoABUtfIMj4PG9Mu8my06IEFNe57tYGf+qR7ypfkJpo
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 0019dcbc-f071-4212-bdc6-08dede9f357c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GefZGoViPB2/bghxBFjQUjaMikslXFdmDWYmWXhQsBj6NPX7gRByzoIfsGEpyFIEZWh+yghky0bbZ9M/Httdsssv21PbeMvpgLc+djKWHaiGJeNJdulLl1nrSdwcmaYGY74brrMf2gk007ici6uL4/j7LWvyBPQ/lgVdpg0Vt17Pv2IfH4bKJxJkDq4ZgQe5izj5jKDbLADjyZzMCOADpOIWVVrJ7XT461xOl/ZvVw6PsW8qqMO5iwd9W4vM4VrOCXwFt7/pH7nr2G02IQODl4EAofXv0+TT1XWSz5BkAVIW4D2bAQ8K+qyJqpzTHMQMrRgiFYJQa2RZfbQDbpE7eALMTBoeCfsOJe0ouCnG2aiKDp9JWyz4LjdjBuQSCgByRFBwbrCeVkUoXJN5wTebLxVPWdF+NpcxXRjWI78Ij+/CpyPUDq4HrYGojBZtcXMePmGJOrR/iHqU/n2ju+gPbKytcFlHKfCBRgFXENYBL22juhjEUllG2ofKNvSVMaiV7z7LgwfTaWTNZL4WJdERJ5/dZwBaQNPOUe+IoXE71C7piPuZvp7HFxdmZunX/d53/SxS+hJ+svorXghWw3QnqV0D/TTQ4SwSD8vxP3kUDx+a6m0N2BiFmTT21pyZaYGgrUGmJVg0RgmgxVPQrKJqIG7zTkIfolUQlYlIujQFM6U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXArWWdnNDZibWE1ZDBIczhWTkNzYldvdmxDR2xZUEhwTEZpOE11MTl0cHdV?=
 =?utf-8?B?SVpOeUhGMVJ5S1p5ZkRyVmk0R0VCZmY1eG95SmVKaGxqWXp3L29WcjJESnFs?=
 =?utf-8?B?UW1jaDR6cXpoYllneEpPVXJycjFvbXJJUytEbmZJeXhielBwcXFibmJPelQw?=
 =?utf-8?B?Ym1zUkVuenlzVHpQRkF5SVc3WUhFME1RSmF2T2tUcnczbUFIajVZd3JBTG5y?=
 =?utf-8?B?RVNvZk1jbU83QW5Tc0txSk8xbHVxNG5SQUNmcHZTSkQxMENoVGNIcWpsVG1l?=
 =?utf-8?B?ZWFEclZybXNxTXlGSi94bVlLTXhyWHN2UWVFc3NUOUlaeUtWaGNTRjUwaUR6?=
 =?utf-8?B?ck8zaWFTaDlQdmNBRXRQWm1FYzRKdDVySDUxZWhqV1ExUFAxaTB5MUNGUmgr?=
 =?utf-8?B?YU1DQUpacEtRZXltb0Fqa0N4WFRPSFQzTGNiaXFUd0cwUmg5K0Y1MHViU2Jo?=
 =?utf-8?B?VUFaYjJSUUtwV2wzZzF1bExiOGxudmZnWWZIaVFlWksvbnpYakdEWjBsZzhW?=
 =?utf-8?B?UXZ4cXlua3ViRmZaNkNaSzhyenFUcVVXZVdKVWtqTjFIdHlUOVl5U3dYOEQ4?=
 =?utf-8?B?Qzk5Z1V4TDFPRHFsVjAvTjBkR2d2RFdzQmp3SVJ5SXFZR0VVYWgwelA1ZTBj?=
 =?utf-8?B?UUl5R05jTXluRVdLdmF4V2svcnlBSmsxUE5RU1pMbkJZUnpGV0U2UlRCR3pG?=
 =?utf-8?B?RGhvYmYxd2FrTTI5ckZjdlh4KzcvYkVZaDU5ZmVPVGxLN1owd1lHRDBHcnhj?=
 =?utf-8?B?dlh2RnN5aU43UTIrL2xJWWlXM0NQOWFVSm5SWkRmN3JYNGdOeGR6MnRBOUs3?=
 =?utf-8?B?S25yZ3p6SGMxNUkycEJhWGRuSWJFT2Fuc2UybCtOaTBPZnd1UzFiNWxtRFAz?=
 =?utf-8?B?U3lRRXVZOWU4OEJ2YlV3ZXdzaXVUb3g1eEwvWCs4VGQ0WEJUN3NUUjdRaVdS?=
 =?utf-8?B?aXRJTCtQMExFUFkrdlRXVExCMzRWTkI2cVp4V3NIYmpNbk5UdzFCWm1Xb09K?=
 =?utf-8?B?dDRPWmdjTC9pcS9GWWkvZmI3dTJoaFVxZS9DS3B6azJqWWtlS21mQVpGNGxt?=
 =?utf-8?B?Q00yVzQrYmFzNWh4K2FSM0ZBYUIyVDMxeVZlNGlkbk1ydHhLN0RCQXRXYnRJ?=
 =?utf-8?B?d0NOZzVrUWZzOWJHQ0UyYXFoTWgwcFpxNnZEUmtGem03NWtQMXI3Zm8yYjJn?=
 =?utf-8?B?V3NDVmtndSthWEVZY3pCbWJaOUU1Rlg4SXlEVWpQVnJUU2xzZG54dnBzckgw?=
 =?utf-8?B?TmZjdlFVc0RkK09BLy8xTWRVWTlDNXlFZW5lV2JkeW51ZnFDblJQREZnVkcz?=
 =?utf-8?B?KzJvbm9hRkhMSzNPRWtJeGRmYW5Cb0xDV0pDZnowMGFUN2g5Y3BRVGNlNDBt?=
 =?utf-8?B?bEVXR1dKSmt1UVRGRHBBQTNKTXNwUm55UDhkNWhuM0ptdC9ydjlKamYzZHFO?=
 =?utf-8?B?VUFGNDZqN25OSnd0b2QxWkdiMGNESFVtU210SVFxNCtkdTZpMG01cDhWMEY2?=
 =?utf-8?B?V1hJS3psdVBJRDN3ak9RTHhYeGorZDRHTzZzUmZLN255K0RSSEQyWFJTb1gv?=
 =?utf-8?B?U3hkU0NCN2ZvejA2NHhVd2lwQVlBOWgxcjY0RmRLd094SzJMT2YrUGljcjVQ?=
 =?utf-8?B?NmllNVA3T3hjdnl0eHJYK3JoUDFnOEhOMk8wajduWXQ4SmIyc2JEb0NMWFN6?=
 =?utf-8?B?QWZOQ0xSWFRCeUliWlVDU21qb2VnUzBsUGUzblE4S2VnT3ZkUHd1ZHI5MVpB?=
 =?utf-8?B?ejFXS0FvTHU4T3BJRjEvSENrU0lZV3pkd2hzUGMwTFY5aVR1QTVubFJkNEpK?=
 =?utf-8?B?b0ZMcnlwemlPUVZzTW85VVlaaDRaWG5VaWFpSFJ0MjVYQzhVVHArMXNyZmg5?=
 =?utf-8?B?VTBhZkVCalMweU5vMzFZelc3QlIwMHZuS094ZmNXZ2wxZTB1RHdGOG5rWlJ2?=
 =?utf-8?B?ZkliKzh5a0IwUnZJK0ppK2l3UDlKR3U2NHVIYUROQlJJb0pJSkI0RDl6N1Np?=
 =?utf-8?B?Yys0L2dNSURUL1ZEYzVCc1VJcUJqWE0rWlZPNTlNVExiVXY5ZkYxaSs1NXdK?=
 =?utf-8?B?RGpOMHBkR0dWVnpueWJFK25TL0FPcUQzM2pzUUN0dkc1dU5DU1NQT0M1bElw?=
 =?utf-8?B?VVFJWkdPSVduWkNWK2pHMTRzemQzQWhSa1RuWFpBRmdxS09xTGJBYVdSSmgz?=
 =?utf-8?B?aGxkQVFzNlBDd2RPZDBFbEd2dXNRb2RBSHhBTFIwbGxxNk5JaTNjQUxaeHU5?=
 =?utf-8?B?R0pXL0VIeEdrYUdGdWhFTEYzRjRBWEZ0b05jUUhiaTlDcHIzQUdobFlEWkhI?=
 =?utf-8?B?NU9oVDdXMjVWa3ViQkx5TUsrQWJzMi9IOWx5QmZwRjRINVlIMGM3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0019dcbc-f071-4212-bdc6-08dede9f357c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:51.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9S+fT+YLibTIwe4Gf9RgSkGMZfRPtxuq7xkr6dgc/KwEVKoilYvOZy6YhTgvdFskv6hwc4lJj1ErtLT9CU1aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

`init!` support interleaving code execution and initialization, and code
execution is done using `_: { ... }` syntax. If the code inside block is a
single statement, Rust may add a lint about unused braces, but the
suggestion will be incorrect as block is required by pin-init.

Currently we use `unused_brace` to suppress this, but this affect
everything nested inside as well. Use an alternative approach by generating
the block from the macro, then rustc will know to not emit the lint.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index c1197a994c82..fd0b5ea4a0a3 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -233,10 +233,12 @@ fn init_fields(
             InitializerKind::Value { ident, .. } => ident,
             InitializerKind::Init { ident, .. } => ident,
             InitializerKind::Code { block, .. } => {
+                let stmt = &block.stmts;
                 res.extend(quote! {
                     #(#attrs)*
-                    #[allow(unused_braces)]
-                    #block
+                    {
+                        #(#stmt)*
+                    }
                 });
                 continue;
             }

-- 
2.54.0

