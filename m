Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020085.outbound.protection.outlook.com [52.101.195.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E2369981;
	Fri, 10 Jul 2026 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700471; cv=fail; b=GXUHMMpzFwuhPDiqnjhVPCeGdi0cNIKFk3vq2pYbnXy8zCkOni+gDHQikRXBJgr+wfd07KT11CMvWOEr+0A6EG3EDsOvgpzdg/1sXmem+PvPY/8qBAQVEX2tZM2c50z0Ib8rPdHs1nGtx/bU2Y1rHuxh+DCYizF2TvFHpzB33WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700471; c=relaxed/simple;
	bh=OqLwQ11iNZ+4wcklsyTGb2S4xc+mLLb5FuwcSUqVIkU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u3uAXurJ2sNds7c0c6w2oiK95DBI/b2tSgjLV/JkZkI4dIgS/3Hm3lBZE7G4ybBs0y8guUCsYNfNjKK/RxjJCFARcGLA88ddDT8N69U6+e+l6HDliH4qUWU2Zo5azFWPMx5HMUG2D4Q2vRGHw4pS/njPMcmFWyvzxcrV8WGaFAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nJVBBFc3; arc=fail smtp.client-ip=52.101.195.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nJVBBFc3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTm9G6635ylg4/h+jCjUjAr+5qBpStqR/E0HxyrK7R6Jc2J+rbINWvEwq/nSnxACEuF7ti90zY39e6wLgzqhJVVX2580+IAKFqBCcgWQNsWK2T2p19L7GJSeKGjOImeuIRiX5oKIgBRTPqzuiUBq+ei3GacoAdAIsu3STqXpTdh+m9Vqte37ZfT6i3Y7E6FnMdWc39XhSBEhech0Y0TepAQ9QDU1Um7ox5S0+ikw0cyEY/TVwqc6Y/E7P2xOCkk0A+j4fvRfUqtCwlSTthyX/F8e0JZIPOaONTpJPSopdkQoYGSFrDFDnnu/XwefS35IHJgM11tdmNnl4VUbXb9a2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOGqrNQVgmuXiMH+AWIYtDC9EIOQSHCRoo07FZsjMl0=;
 b=myD6SzSLq856axClzx46Ex4biOgMhPgeY2CWcOPhHj6uMcsRttXqaDyJ9gV1wD2KwYdYl0OjFCgql6YAX+lWzevFNgS2IZnHLzRcmiH9slwl4bhDwQJNIPO6L0kxg1yWQzuHj1qy8Fqk8HYAsfJWjdLJQJFHfER2n8QsLGJxTp+4ZVn2g1B6r71zQilpVvQQvzQ9NT34vFGdCdvWYZPnLS+IGFXaCcD+8MvK1Xhs/sfdrpRu24PaGoZvu0RpulhBesdWS/hEYu6M+/F5FnMZjrt+MY0A9PaRBrYMHnPzudvhN+Dhda/0zX/dMqXzTd8yOU/YWJXTEu4EOZwBuiw0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOGqrNQVgmuXiMH+AWIYtDC9EIOQSHCRoo07FZsjMl0=;
 b=nJVBBFc3Td17fajMrAeVO1hukOYQ2757aBaWk4QBtjkPdNKiz6UtwHOuGNeW/QNpXEaYeu5u5TDacYZabzcPTYaC1xV1iRF8/dnMnr6DsY0RBDKgnhTrg9uAtnm5UQISRy0z2GGFLs/7u57Gc5jWL5IPmiMf3r8tPWLlWN4Y5uA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:50 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 10 Jul 2026 17:20:31 +0100
Subject: [PATCH 1/7] rust: pin-init: internal: error on duplicate `#[pin]`
 attribute
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-pin-init-sync-v1-1-8fa16cde87ae@garyguo.net>
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
 Gary Guo <gary@garyguo.net>, Luiz Georg <luizgngeorg@gmail.com>, 
 Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=1453;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=2awq21xDmkdQkkk5MaFw4jhr4r9hJLYM2rwfX55So6s=;
 b=gxn/R37lUecX9I8i5fV5AzNgH69xfKnSjQ/Vj0JAQW9ETNQB8S9is2hHYxKf2ihMXJW7m/vXF
 2zU2G9DI814B47utPILhNzg4eGCxt/5eEb7ZTqOf3FLnhEDbhfhPvTA
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
X-MS-Office365-Filtering-Correlation-Id: 4197213f-6df4-449f-91c0-08dede9f34b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EMaMdDSHMN/edgq1OSp1A39vPskmcOSiK9rczoVQrxhJUN4bsARfW5l9htKlEJRnHNw5kL3JDFTi4tFawkXkx2kgS/5NSaKcBiUU8CtUttO6BIdVgxdF8Klea7ZEJ9zXC0EumwHRUvgs8nZrJj5+HJGgmfR9IowTKuBVwtq/rR/rczIngLmDlA9lg3mLHkcevpwJU2Y9vEAK+E/BFxt4Zhz6OCuh8TOFgRlPUXOiGbhc+bXnMMU9B49I8532jHwPzYgOeIKboo61vBC2SU8OPgesKl6JCsZ0l6LhGysSfg2YOc/+pNFr+/MMlDmp5UB2/2a882Ot0X1NjgPbvtPkn6OcKE4DpzyKYPMLqCP08NB175+l5FUabqbVLTwbecidwcMt7Oi9ufusXaQObWD7Qh+PxDZmzq9e3be6KkWp6acSULKM+4OdSelgUlEMXL6V/ycEe5Y30NefSibhgwzUM5eOdAQeZzVfFBRYIhFKTASE4LznI9sY6u7EGTMil5V898D1zbDSPGrWWJhbkp6AOqTN2qNe5e9++BCrLf/PQmNR5qu88f/JY0UpLHXvO8whvKP+yUH5L6ksgwYLcjoB+Q4BbITfwtVp8jLmwXRzWj2Y6MBStvXt/iJGj0OVjUuLsk7zjghr52ckvDg5dcE6339OmRFFZZ2EQVrAdxKim7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmZVZ3B0T3R6SmxyU2Z0K3JobTU5TEtsc0pOZTU4blZIbHFadDFtdHVtb2gy?=
 =?utf-8?B?eWxzZGl3NjkxVEtRZWRGNEtqekJkazJ6cjVzaTFXYmhiMGs5T01vamxWTWZj?=
 =?utf-8?B?d3JTRlBMeitwVEJmUExyM04zZnpZK2RUbjcreGtwZlE1aXFyN0p0S2xPdGRZ?=
 =?utf-8?B?Rm5zMkdNeXM2dk94VnF3MGdoRTIzZzVndXVoa1pqT0tIMm9RcERyVWROdVRW?=
 =?utf-8?B?a1ArV1dyTEcwUU8vZjZCaldPVXRZUlhqRHBESTVJWEh0SVJsMEZzVTVlNy9I?=
 =?utf-8?B?VzdHT2ViZDRzNVVsc0pSdWRmbWZCcjRkR2RWbVdOaTMzZ1pjeTJta0NTQXhD?=
 =?utf-8?B?bDJDRCtWZTh6R0Jpb0xkSm4xMlY2cEU3ZHIzT1Z3WlFJczZvWnFkcEU1WFZT?=
 =?utf-8?B?TkZ5dVI0UW1Mbi9IWit4N1A5cThoRnVKd2RWb05pbUxFQS9mQXR4cTVEMnl3?=
 =?utf-8?B?UTZJUVBKc203N3BFOG9sVXIrWVlVWFBSUlh5N0N3dHltRE10SFNzWGw5Z1RT?=
 =?utf-8?B?VTZjaUo2WEsvS3BQUjZOdFJZVEgxeUdxemhwbUFmZE9pNFVUYjJsNWZnTjlS?=
 =?utf-8?B?N0FtMTZmRytvWXVqT0w1dG5EbTkwSWZjRHlaTFJFU1lQRmNlRXNUemczdUEz?=
 =?utf-8?B?Nk0vRUVmaGMrSElkLzRVSHpEcS9OSGlOd1J0eUxZYjFheVVEMDlLUVIvSThs?=
 =?utf-8?B?MnRrdCs3SnB2VzFkSU5keGZSbGU0MG1MRlBOWDJ1ZTA3TGlpOUMzNkhIam4y?=
 =?utf-8?B?aFRaVXd6ZmFwYzZmMTFXSXduS05qRHNjb2REWGNIZnI2NmtlQnpyYm5BRlZS?=
 =?utf-8?B?ZlNjSGJmemQyRUE2SkhzcnR6UkcwWG5IdnZOYXIwL0p0MzZrUld1NHhlRHho?=
 =?utf-8?B?bnNYUnMyYkdJcHZlb1l4Q2dCMGl4eUhSZFBsS3Z6WWRKUzhPYnFvcVdEdWxk?=
 =?utf-8?B?OTFzVmtPdnZWQ094R2VQMW4xeHBtRzkwaHlzUkYwZWMwNnpxc2t0MmViSCty?=
 =?utf-8?B?Y3dGNHBHZEhCa01FNzRzdElDT09GcVlrQWtzUWErdlBYSXduKzBZUEtKMDZy?=
 =?utf-8?B?ZmhId0phNVV4VlhPTHhZZWdHOTJDUU5RYVFFOUEzd0dWcW0yTGxTS3Fjc2t0?=
 =?utf-8?B?dmRZSlB3TkxuaHJhdzFUZ3ZJNFlvMDZsK1VLK2NuR3pYOVdtR3RuTUxZRzMv?=
 =?utf-8?B?VU4wNzE0QUl3Y2FqMjJzYmZibDRYT3ZRRU56U0dEWkt0djZMZE9tMWtoeG5H?=
 =?utf-8?B?Q2w2dW02M2xIZGJuSS9qRXFBY1BXTUs4SDNZSEJONms3emJpeXM2R3o3WjBl?=
 =?utf-8?B?RU9JQ1RpOFNEdWVrYTB4L1Q3VmN0K3JSL0JtYitTT2NhU0hveGJBUVRnVUxP?=
 =?utf-8?B?NnQwdGRTL0RhelJYUW9uYitPZkRaTk5ERmRnYklOSU9MR3NlaWd0QzV3SnBy?=
 =?utf-8?B?cVZQWGRRaG55L1FoUFlOM3dIUll0M0tEZThXQmQ5U1BKdnY2d1lTdi9wbzhW?=
 =?utf-8?B?aC9PcVprY1VFNmJ5NytHcTlBamRTRi8rdHFTK1UrU2NXUmpQNlRFWXR6M0s1?=
 =?utf-8?B?RXh4Mnh0OGJTLzFud1ZLcjB1dzlxSjdPYU9NZkMxbWNPdGhZWjA4VWZ1RU45?=
 =?utf-8?B?cmRiNzh4Um1KWGZLSktGLzJ0R2NQOTc0VjVldFFkK3kvUXkyYy9JZU56aWdz?=
 =?utf-8?B?c0ZJaDhvd3o5dlBrYVNkQllrQ0dCOFU4Q3h3MjcycDdETlM2RWNIMzkxKytE?=
 =?utf-8?B?cENDejZFSE9rVlZ0WFpmbHZXaWJWMjJhOGtSMWpCeVlybGc1SHl4SUI3VWpT?=
 =?utf-8?B?WUMyT05rMEJiTzFiOWU5LzhITFhYZ1pGN0ppNXJGQi9UcTJFVmpCL1BRaVE1?=
 =?utf-8?B?Nk80azlkOTRKa1NSU1hGRXV1bG1SM2lIUE40aUI1SndDOFB5K3UyUTZsaHhr?=
 =?utf-8?B?d2ZXZ2RFQmVUdlpxejFQL2pGeDNjTC9qUjYxNDZWcWo2SlpQRmhKTUo0UDk3?=
 =?utf-8?B?dUI0aGxUb1crakZCVXY3VWE4cU8ySzE2bWMzaWxGMW80ZzlLTHg1M2J3T2ov?=
 =?utf-8?B?eEhDMm0zc011c0N4dTJVVGZEa3hqa3ZDNDlTaWFiNXVxdUhXQytncEpvMzUy?=
 =?utf-8?B?bVlRZ0dDeHZRVU9RNGQ4QnRXaURRMUJjY1lGeEJFTGpoZjYyc2JFL0VCYiti?=
 =?utf-8?B?TTZSNFBxM014ZUZTdk42akx4Q2w2MlBHQjJ4bzZhc25wa3lQeHRtNnQyNGkv?=
 =?utf-8?B?SHp4RTZrZDQwaXJJdnMzaGlObFFjTUtxaVQrQTV1ODRpbDRwRGhoSEJrcGtH?=
 =?utf-8?B?eElzTU9YMDNNNGJPY1ViZWxaQ05oc0d6SEljTnVxbHgxTlZMVUZMZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4197213f-6df4-449f-91c0-08dede9f34b8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:49.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nj6hw/gBSrim4RSpZ5VN3v+3CaTCdbVScE3YzqONtKyJ1ZLKPrAmqWevz9mSDxuKM7YgGFuFYJVe4sRrKs+NRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

From: Luiz Georg <luizgngeorg@gmail.com>

Duplicated `#[pin]` has no effect, thus error if misused.

Reported-by: Mohamad Alsadhan <mo@sdhn.cc>
Closes: https://github.com/Rust-for-Linux/pin-init/issues/119
Signed-off-by: Luiz Georg <luizgngeorg@gmail.com>
[ Reworded commit message, and change the logic so code generation still
  continue after reporting error - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 9fbbd25bcaac..263f67300727 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -85,7 +85,10 @@ pub(crate) fn pin_data(
         .map(|field| {
             let len = field.attrs.len();
             field.attrs.retain(|a| !a.path().is_ident("pin"));
-            let pinned = len != field.attrs.len();
+            let pinned_count = len - field.attrs.len();
+            if pinned_count > 1 {
+                dcx.error(&field, "#[pin] attribute specified more than once");
+            }
 
             let cfg_attrs = field
                 .attrs
@@ -95,7 +98,7 @@ pub(crate) fn pin_data(
 
             FieldInfo {
                 field: &*field,
-                pinned,
+                pinned: pinned_count != 0,
                 cfg_attrs,
             }
         })

-- 
2.54.0

