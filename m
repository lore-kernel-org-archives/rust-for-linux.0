Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020132.outbound.protection.outlook.com [52.101.196.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCF53B3C12;
	Thu, 23 Jul 2026 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830820; cv=fail; b=ctTatdiMu5oOmZqKJiAo9Of7OTR5FtBMXkZSGybDjBuU+fIVvpRo+exD1GCsd1BZyyNE0VKf6GoHSMOuNLi/haroA3SazpRWIH1K1PdbL3tI6SdJRNhVNczftNFPOBkvdwMLs2MrzGmx0HM1xp/1T72NdSmh+guOMVyt8aAFWZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830820; c=relaxed/simple;
	bh=cfqJAKZbz5WD66mg6tqVeGH3yApXRDfnHcYB7ewl+RI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gbmAWlgbacP7UKEzGJk/+H2qn8XKPJgMveWTq6Ycri6eGFz3xE4QF1gG1efwHi6OF5pu2hU7DgHlFsUouIp2ceMG0x4sIfrPwaOYuNcjmzJL9cIM4JG66WN7kHfY/gKFIGXi8rsYszQgqYMLcfLRcPZtmSYLAG3/sHJoHgDqMG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XPdi3ta1; arc=fail smtp.client-ip=52.101.196.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XPdi3ta1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvV5WBWegqyVBsuPQvrhE5/eEzVfB+OjLTnn85Q7hAaCQwiYvnt8mZPgfOOvcWZt+wU1Z7uCL0hGEJz0X3/zzn1MIUVt5idIMAWvTCpPmbYNZeD0hmhje7NKoX5dTTx+ysfzjlRJggBoYJPv9BaUDYxdBIaCHCQPcd1RhHYlfrRBHwK8jUsL0ioVJFluEcmL0IuepQN8VQ0ioBesozjHBwIYlXC4DtCSIz/6kvOpx1TDtzanNA5Hvl+VMYGOiSuJDqweARkvWiK18edPCBpZH7MDi2zHUlDJ8l8C2vSb/KNiZEdhGn6g3pu+GaYGjTsNnNNOJCyPws2xNYUNu3UAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPcMQ1zHtWEV800S3JuzRO9rf4bFK3q+IczaXYQsUKA=;
 b=pHmo5ltd4pA+5Yku+sYaxe+bkJjhIMpKwhb16eG60FGf7QSlgwNC7IehtIy63UAxFF1725xiLKKwQxRdawZiFS/X2dWhUe7/2QOo+ZX/rdkM3JtNmIKKLpJMFzKzIVgh2vzQIuYd+I1RKWrv7FB4YtRSIuXtc7RqGgER1wmDeioEZ9KgZxjkpQRLm/UBXds6qx7phAr420Z/jrlg0AUWV+DBhPkCQVR8P1Qrt4WSR8JpSiS+zw5v2GjZtowF3N45kYGHkU2RnADDdCdUcjAgfdKYHLCPq/ni9bVStjcal0wzt7AJiKQovOn+UxoSsDeTCKxrYKBYYJnEEc8ejYwq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPcMQ1zHtWEV800S3JuzRO9rf4bFK3q+IczaXYQsUKA=;
 b=XPdi3ta1aa5qgkxwwWISPiNwzmR6bQv13V8bvOromTBwDHIenV5MwuTfe8C9mBKUANxibUDyHczCduVjnjTPawwXDEb9JaqkVyenj5hoplxKSnUanlur3o82S35fmIwjNWi+Nojthi0FWpYxtpKQVJC32Ba/BlCyO6DopdzleWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2549.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:4e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:19:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 18:19:51 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/3] rust: pin-init: upstream synchronization for 7.3
 (round 2)
Date: Thu, 23 Jul 2026 19:19:43 +0100
Message-Id: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD9bYmoC/z2MSw7CMAwFr1J5jUU/AhSuglg4qUPNwlRxQEVV7
 04CEst5ejMrGCdhg3OzQuKXmDy0QLdrIEykN0YZC0Pf9sf21A04i6KoZLS3Bhz5MDjnIzmKUJw
 5cZTl27tcf2xPf+eQa6Q+PBmjT6RhqlNOzPt/U3nJsG0fmdjWPpYAAAA=
X-Change-ID: 20260713-pin-init-sync-de5399bfa9af
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784830791; l=1036;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=cfqJAKZbz5WD66mg6tqVeGH3yApXRDfnHcYB7ewl+RI=;
 b=o8w3WwTr9sgZffIEIC75wJiJ9cPWnz8viTHbms+FTXq23iuhJOJeEX7dx816Cwk/uoGH0gwoJ
 hlH3GyC0rIXCTklQ1ryNzVx8QvIzcYAvv5DVfdC15iN13aNTFVrAX7z
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO3P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2549:EE_
X-MS-Office365-Filtering-Correlation-Id: c383358c-47ca-4d4a-6023-08dee8e6fcb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|7416014|921020|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F1ZNCZh0cFvmULlbYrrhhrjbnhTMj7j/dqjlqGZ8be3v9VcO+uVmV9842fUcKT5dyD7WCTnBtG7AWluF792vpwvi/Pu0PslBKQVDlYJqmeDL3dp7VugerZXsfETet7VhV+TXVxf59f8osKPA5IGOWPCbKGzAPLTUgEQCT0NXaPR+05CI0zB05+KcV+Kxmn4ScPDZe0eopi6COTMe9zyBb1BbQ+wgPb6ZCpWu6dXMYnjpcBn45eE0G0s93682jLonVPOXT0kBuoc4UHqmkbg+79p1Zzk/FuuH5DHRGHh4REFhnpZlCk8xNaGTjMEPvJ0AjztzxOHapABkltJKROnbg6maDdebdZjCw7HGlHRkMQ7RaU/bc7piIymC5OlPNH0TLSdu0f50suxgZYWW1v3SJR8P9fQ60OQ7XK/d+Bcotl3OaQwOGQM/kl+eNvAb2Hf7x/cTK3XHBCS6oYO8fHcGVWzADkMujk7b04rF7EFjeMBGxZVRBtzFfxJ9JjbukJAEVTfHujniH6++F8U0ihrV+8rhBwR1ZCdUB3ipaDdi2MFtpkf/gfRKQ6aXJhIS2UMWpSA+e6HofDYxaKOLV6BzeAKSVLCEm58YMhyRzJdXnl/xnuZDbppv5DMh0w1dLBNF3wdu/yleRA3uoKazxyJJsOSl0Ohz09XUUy6pIqLss4tEGZj7UDlegHsQ1CZpe+0FTPTwRoBk3W1iz5hsEJfx7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(7416014)(921020)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHJybENOTkRFS2N0NEcyL2MwSXFCcHl1eWR0cG1lSzlra1VWbzJ5QjdzNHpa?=
 =?utf-8?B?ZnQ3YVg1cHRWdzk5TFdpdWc2ZHdLZDFMRzhlZHpoWkRxRVJ6NE1JenVpZmtI?=
 =?utf-8?B?YmRpTzN4bXB5VnlwM1lreWNKUTVoS2I5WnBacHRuTFRFU1VsZU50a2xTc3Vn?=
 =?utf-8?B?TTQ5WXFHT0EyRjdmWjVHTkZIOFNPaHZ0YUJjOTl0L0VOUU0yeExQZVZhamdV?=
 =?utf-8?B?WGRpMTQ5TFllZGR0Z2dNdEk1UGNqOXpmaVJHSkZLY3kzcGZnRW9YNEhPQmJP?=
 =?utf-8?B?Qm5aN2R0YzlvcHJheW9nYnlKbC9mRW9qUm94VDBOR0d6R0Z0SVQ2ZWFkZjJa?=
 =?utf-8?B?LzRSSXNaNEZ2N3lMQ0lRZmVkY3E1a2NwOGRuUTJHQmRhOHRKVmRFc1liY3FL?=
 =?utf-8?B?UmtHdk9ucUtBQlhhT29UV3VSTTdHVVpDNWVCQUlEbTM4SGZzSnp6R0hYZExU?=
 =?utf-8?B?MjIzM1ZtUkZJVXltYXR3WUlnK0FEandaMUVRcGYyTHVRVURzNFNLZjJnaFhQ?=
 =?utf-8?B?YkQxZk05R05rTjMzRHdndEtOK3pmYU9aS3d4UjdmQ2Zya3pLL2UvVnZIdUZE?=
 =?utf-8?B?Qm1IR1lPcDFXM0psNitTampmUnFrNlBHVWFOTTNCem1sWHhMdTlxd0xyaVlX?=
 =?utf-8?B?QUFDZVFmM05VaXY3U1BSR0pXRmgwYzhWYVBYV041MlBOd2VhQVVTUGNEaWVp?=
 =?utf-8?B?UE9XZno5VmRRbFVYVDQ1K1Y5cFNjY1hJZU5QYjNwWmJ5SFpNMGpqZUQ2Y3k3?=
 =?utf-8?B?bG8xOXZaTXZuM2xhcmEwcFNkZGEybWxCejBqd2RKdnd1ZlU2ZHU5WE5BNTlx?=
 =?utf-8?B?K2lUSDZLTmlOR21kVzB6eGt5UVhsbG5tZy9PK05NZkVXeFRkUVdwVzBIN0V2?=
 =?utf-8?B?Uk9iRE9TL0dPMnloNzc3V3owS0tWdGJGTVEyMDBjRUF5bE11bGVFN1BuWUxE?=
 =?utf-8?B?M3FDT25DZVhFMm5uZTljc1orVzBybkhsWHJTbExuR0Z5WVZmUm5sa2k4a21Y?=
 =?utf-8?B?dHUwWkR6UHhpR0V1QXRxWXJoejNlMGNTQlFyU2JZeWJnVFFHNFVWdStQb3NL?=
 =?utf-8?B?ZVJCQ2U3bldBZDF6VjhueXZsT3JUd0dwYWU3ZEJUMTNwZXdhT3ZHcDV3bEE2?=
 =?utf-8?B?NXgxRGVTYlpmR2t1d3JhaTZ5UURPR2J6RCtYMlJ4SkV4MVJwMnc3dkFCYWRK?=
 =?utf-8?B?OWEzN3dpM3Jwc1R2cGVldGVUcC9KNUpkaWJweWFtL0hTMXREZ3JIQkxvb3Iw?=
 =?utf-8?B?R1BkT1dva3NhWnJ1SnpWay9jM3Z3T3BCUjZObTZSVUdvb1Q5YmdyaGZYdGVP?=
 =?utf-8?B?NUN6MzJyVElSUjRQOGpKM3U5dTJEUkkvNW1KOW1iNWttZ0pmRVlENE1UcjdH?=
 =?utf-8?B?VzMyOGcxcWJzNTdpaFhRRXUxQ2VUUlJZRGtwZ2VDMzlCUDgyWS8yMXFIQ09I?=
 =?utf-8?B?am02RnJ5em9WOGh4d3k4SzgwR29iTVhNaXhOVVdVSC84MjhWVU53SWU4ekZL?=
 =?utf-8?B?TTlad1hNbnF3UXJFNnhhZk14UHpvcGxPc0h0ck4yQjNFZUNsZ0FTbEt1YUhl?=
 =?utf-8?B?R1laTkNncjJaTytkS05zNXdGcVJQWTJEMjJVQ3lSMW1KQ3A3TmNJUjJtRkxp?=
 =?utf-8?B?VGRod1hIYURzeTFHTTBvQzBGV3hVbjhYeGxZV3lNVWovNkJTZ0wyT3U2cHdV?=
 =?utf-8?B?SFg5R2Z0Ynp4QS85N2hXaldJYkJwQTcvYTE0blEveDRXWGg0OHlqNEJrWFZN?=
 =?utf-8?B?a2xLc2RkVUg2R1NaTWJmMWxQOWw3N043dUp3bFF3UGZpY09PbFpQMmJUYk1v?=
 =?utf-8?B?UGFkbk1xL1E5b0RzUzcwVVVubEx2UnBLdUFZeXNKdTRseGVYSDhpSFFJaVgw?=
 =?utf-8?B?RGErZk1vcmhIQnZlVXlGTGJYcGMwcmpMaE9FSmhlbFMvMTYxdGMrVlVxZUVK?=
 =?utf-8?B?YUo3bTFrZFU2WEhuSytsYis5TWRacjJNQWptdjZHZU5xMC9FOEIyUDZ2cC8w?=
 =?utf-8?B?aklybDBVWTUxTUl3V1BiakFDb3FZcHZoNS9aak1SRzFpN3hCUStWc0VMV1d2?=
 =?utf-8?B?V2dtWVlBWEE2WEN2NE5rWFhwVEk5MW1kRVpLVVNwcWZXVi9hallmZzlMMTNQ?=
 =?utf-8?B?MkFXYUdRaGtrQjVtcmc4WlNvNXlpM0ZtRW1NVVlCY0h1R3o3bU90WElOaVR2?=
 =?utf-8?B?MEJKQkM1d1JZTkRwTUtONDhaRWd2eGxKTHJtS0s3dFowdWJDTG15NnJMdmNo?=
 =?utf-8?B?RGl2YmxRYkp0eFJnTERtN3d5TW43QTdaTEE3eGJDekdTeFB2bmpWdkJpU3c0?=
 =?utf-8?B?dEozVnFJeElGWDdkUDFrSjFTVVZHWE0xemRmMnRZdHlFbzlSdGc2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c383358c-47ca-4d4a-6023-08dee8e6fcb4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:19:51.4017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gf4wwX+G4oIw1f1xK7UtCtjRYTFtuCmtcISRiTLiRJzRzRak8IlDNO4zu0DsjBvnmIk3ckkdmZsHNieDsIJh4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2549

This is a series that synchronize pin-init upstream.

It includes the following PR that I intend to merge soon:
- docs: link `Zeroable::zeroed` and `pin_init::zeroed` in documentation
  https://github.com/Rust-for-Linux/pin-init/pull/158
- internal: rework how `#[pin_data]` handles cfg
  https://github.com/Rust-for-Linux/pin-init/pull/161

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (1):
      rust: pin-init: internal: rework how `#[pin_data]` handles cfg

Nicolás Antinori (2):
      rust: pin-init: docs: link `Zeroable::zeroed` and `pin_init::zeroed` in documentation
      rust: pin-init: mark `pin_init::zeroed` and `Zeroable::zeroed` as `#[inline]`

 rust/pin-init/internal/src/pin_data.rs | 82 ++++++++++++++++++++++++++--------
 rust/pin-init/src/lib.rs               | 12 ++++-
 2 files changed, 74 insertions(+), 20 deletions(-)
---
base-commit: 0c20f77a26b89bc911d31cd79f1abe1a7ae57f60
change-id: 20260713-pin-init-sync-de5399bfa9af

Best regards,
--  
Gary Guo <gary@garyguo.net>

