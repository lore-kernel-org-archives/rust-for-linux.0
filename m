Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020132.outbound.protection.outlook.com [52.101.196.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0D1D89EF;
	Thu, 23 Jul 2026 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830804; cv=fail; b=NU2pa3w9l2SJECyvyrGTVajmDQJEHTSiHUC45uUbPrjcPAIYLp3wwOddQSafK/M6IK1D3X1Vc5GMB9O4nXf+wEXBlCwtPYR2RIfxhNCUx4DHRY1EvM6eQ/BuU0HCHrNmO6YNX9D0Qy8w0JgY9Exbn8XnwvpuTiw8W5URKnL++cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830804; c=relaxed/simple;
	bh=cXpPUMYxcY71S/US6fmcDRcwXTiGT1dLXxWpX7YrJj4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Xbs8QtLvDbjJ6dk4BShnu5Pj1AL+Hf2e6gZ51VU+pvq5ldLXaLtwvarVlsnFsf8cM64y2+vc9BTSiUIz+/f9IiCLroJt1ZpSsTbuVqJqlS1WlPXXIqs+EtQ3JIvvwFvJy0vbwZyj/iRQTlOKL/HU63Run95q1unl3JobEpVa2m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jlYOixzj; arc=fail smtp.client-ip=52.101.196.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jlYOixzj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Myj0Dm/daviEbjZPkcm2ejgworjfyAk1NdgM3pP73nRigHYYfDcnAgVFmh5Y2slvqWcdJCHEqoJEuwJSa3aiPLjQYkLWjeVS6GMuZTLF0h3brzzm9OqFRbcWtLeMSmRrLNa1JqZZXN5lH4aysqRVMV8VEJTDpX/rYvOHThfeYRDsBIk5Ezgdu1LDVO3K4DI+X5INvXkPhFdTI5rGazTULTNs/a7n7QFuMmRIZNca9uYbdMqul52zovaXqhfsSUIuGgLepxVkpMaRCRVZTxvzQudosrK4neB7NsT8DRgSUlOKGA71nuWc42xCgUrRMXHJe8b9Fd13C5CmTehFTdqtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkFE1akcHlYMBzud/S2uvrn0ZQ9m0tcIV5oFZDvQv8w=;
 b=m4LQEKGS4aPJV4+scyV2QbnriJb3Zr357Jqbauu7Mrt8QSMyVYb/+NHOSaxfex/Kw/Wx30imRdzW7F6+dvb4lyT4oOe+Zdj4b4RTKcEMhU1zQM4hUclQ2vXpEGIKyfOYFy4TsU7HEce2xZZUP6pOnTnZDHyjuS0OVomfIg4dDGLA4tlRWoNDR+7tot4Aje/CoJcagq4R/Mp4CBQ40912WxRcydHR6XfWsr6OvPl6cOI2ZhuWMOm8zY72cWsCi4orqJIKsVr0zW7m2k8/eG41p0Wg5a4pkJLJJnJM0a31NSAjDwVsLWdzIv3u+mfL5fFD2NidV8SJjjBQxGBhML8xiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkFE1akcHlYMBzud/S2uvrn0ZQ9m0tcIV5oFZDvQv8w=;
 b=jlYOixzjqGqUn8DLLAfPwgZgZC/dWJPSCsvydEuPsUQitp+T/aGOXadiXjKB0Pr1AzvMxmIZOWeiUe08NI6sp74tmQ4oE7XBQ2z19XKzwY3jqWORatze2wXfjt+Drp/4tM8OwMzb0Gep93Lnbk5ke7XuSs0k1Orz3w2SEmXb2do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2549.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:4e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:19:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 18:19:52 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 23 Jul 2026 19:19:45 +0100
Subject: [PATCH 2/3] rust: pin-init: docs: link `Zeroable::zeroed` and
 `pin_init::zeroed` in documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-pin-init-sync-v1-2-dabe7f902cef@garyguo.net>
References: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
In-Reply-To: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784830791; l=2103;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=ssF864R81iodwCD287oZP8hV/YumxfPqKXjeu4o4t78=;
 b=NteBojgNBVWU9aNHF/mNu6wsk2zBb0Gr4iJIJB4dioD1s9Hn/+eE7hZUzP0zm09grUutIcqsD
 5a4dCsHpgrgBtor/mFnVMoQGzY1VCJCaKlsJ1H13CAULGRJsV+4sHYM
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
X-MS-Office365-Filtering-Correlation-Id: 22d189f2-7cfc-4170-7d2d-08dee8e6fd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|7416014|921020|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F8PV7+oIYCc/5A8I7ZvKtD6BXWuXaH9Yp86tmXK/D+C4veUSnjtvIV8jbxqD0Rh86MF96jl/vx3y6sntZzUzGskrq88uA8xWxjOWjJIpzNnjZPXJQ3RorOCTP2GUDMXClz1sfDhkG0DRsTKnujo7nP5vi9ScKdiYW2S64yd5VYE6wZ8oFAE6hA2dpIxiOUAu3sXRZvW8qlx8I994yF8uEmo93SOTh9g2Az/DbdkwWrsbfMFy/T3ZaS0rW5vsHDrbIzJr3rEq9gy+VV/Y6v8i++KypnIezcQAuhgUaBfM1JJX495BeoGlecQhUGmn7BBZtgxgnGbbFa9/mbtwTSlXlDZTvOrzsmt0HGNicK0s2vYGs4MaShbgoTPdPoGOODOtP6QrU9zFr/uf1VOywOLWDG8Ss3flYMR49ZgozYOkByBcXImTZKaDKQMZGncqrDjcsaWMzfcrF54fnw2szI+gvRdFI4EAgTAorZS+XFscHmXji8eJPycsDwrtnC49kEFAaBUJVeoVVKhlRAmmEjifwH/wKrtk+Qz4+qzOtBVSTnm3vT8sCX/Aa9E2pAKXXOw62TtEPL2Qbmd3UNBFoFHqUxTEuU1Z5QRb8Tp1eBZRbbf11rYeLviWFS2P635MjtsIVEurLeeBfUt6AGXJPstikvfjc2iTxpzo/QkuD/EhHPR28IIJFv2fYymxltVvNGmDHMUPphjRM/cOpHFFxSrGkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(7416014)(921020)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjdrZ2QzSXBJTUdTd3BHemd2RTl0elllZWI0VEp4L0d3cUZBdlFxQ2hCdVA0?=
 =?utf-8?B?NnpxNkZHaS9UYzExY1A4Z1pOVTRYeTRuOFhwOS9xQm8rWXNKV25OUDd5TjY5?=
 =?utf-8?B?V1VEYzFhTWFWTEo0RHZCZlFNYWZhTThDTS9mb21TZ0FodjVyQnR1cjdxQ2lh?=
 =?utf-8?B?SG4ycGxMaTRlVlJzLzZpZEU2eEdGNW1uY3hNNWtyZytITG45bFB6ZWpURFJW?=
 =?utf-8?B?aUJ2ayswRENJbFpwbkhIb2dYMTBpTG5HVWg1dkY3MHlTT1dpanRWZCtqcjRV?=
 =?utf-8?B?L2ZPT3FRR2ZpdW1WWlBKTlV2TTNOSDVKZHVhKzIxOXFyalpXTE16NXh5V2V6?=
 =?utf-8?B?MnExd3J0Vnd2MU8vamhBVlhKaHc5eVF5THhDZys5SFlONTZ2TW50U3BoSjdM?=
 =?utf-8?B?aCtIVkEyYUtidktlWHpTSmZJblhhTnZxOWxMbDJtT2V0VHRwenpadGV6djhC?=
 =?utf-8?B?R3hUK3lzZTVHQ1M4WGZzSWczb01DRDZlV00wWlRpeG9nd3I2ZGNxL3VmSmt5?=
 =?utf-8?B?enkyNGYvZkRpa3V4b3ZkWGZvbEU4UHp6U2FtR3hEeVBkUzRXRTNic1VOUjF3?=
 =?utf-8?B?MGR0bnJCVmx2SlhSdzBiSW9SNldFbXQrS29Ec045dHAyYWltQ1Q4TURiV2ZM?=
 =?utf-8?B?bHpTQ2Q3YlBFZ3ZjZGtCeFB1ZGpscmluY0ROVnUvQnZkd3RsNEJJQ0VzRFBM?=
 =?utf-8?B?N293ZG1xNTRlelVkV2NMTnVjeHA2S2d4ckFZM3RiUTFrOUZNRld2Q2FxTHpG?=
 =?utf-8?B?VVdQVUpSVm40N2E5YzhwT21NZXNPMFdNWDFKTHFiNmRUYTQxZzJFVjJBWDhM?=
 =?utf-8?B?TnpGTm5DeXBMRWU2K3NrZlVhZFAvOHQwLzBIZkxOYWFub0JZS09ma0hiSUdq?=
 =?utf-8?B?ZkN5OXpBYkhyd3hIcnJ3Z3BnU0w3bDNWTHNhaFAyekJvbGd0WS8rbUVnZmRj?=
 =?utf-8?B?ay9iZCtQMUx3U1RlbFV1d3ljQzBTcmkzbWhKNDF3UU9sdUs2R3hqNWpCWU1D?=
 =?utf-8?B?amJRY3VteDZQNmlkTTVKcHVQRk5rL29ZNWtZZjdsaDBHR1AxcldoZDBvTGl1?=
 =?utf-8?B?Q0pNbjBjMit4elF4QkRxdGpoMGl4bUNBQnA1K2JHbVdvZXdsOG56MUdqODFG?=
 =?utf-8?B?RmNwQk1IM3Nsc2JZVTFFSS8zZFk2bVJtaDZ1aXZpelFUaE5MQW1MOHRHQWha?=
 =?utf-8?B?bmFkdTY4UzZiL21IYzc4RVliM0U0eVg4Y2RoVWsyTEw5WUJDbWpBSHFHUVZi?=
 =?utf-8?B?VFpZRThyVVJzaTUvREtSR0xMU0dGbkorQlVlcWVBanpTajAwQTJkUmVmUTl6?=
 =?utf-8?B?UVdBYW9OeURRUHZaemRGUG5wYjArOHNjUEN6OHQ0enZYZnRHSGRIUEY3M1Vo?=
 =?utf-8?B?OUxWaXpHYmdDS0FBOTB4TTlCQVFzVmlHdVVsaWV2WitROXIzYUF6Y0FibTVG?=
 =?utf-8?B?dW4vdWRZZElTM1BLLzhBTjJmNHF0OGxWRUpySXV3U2RkeHB3RHRLNWxaNkFa?=
 =?utf-8?B?R3AxSjJtRFZHc3ZwbG9tR2dKb25YQTZ1TXhncDlsaGFqMXVVRzVTUXFJSWl6?=
 =?utf-8?B?aDhSM1llcjVOdmN0enZqREtXMFlQbG5DS0txWG1TK2kwQUxGMUErRlFZbS9v?=
 =?utf-8?B?UG4vdnVhSUx2SmRPM3NJRVhVRW1vOFJmS2oyaEd0MVM2UXZzeERlb0lYT1Ix?=
 =?utf-8?B?VzZBK2c1QkZxd0dvMjh6b3hkUThLdmFFRUxrbG1vQ2FvRmxJUkJ3TGhpZnVh?=
 =?utf-8?B?ZXQrWFRIWFpkazJXUHFVUDVnMndMM0R2b1l6UHJ2R0I2SWx5cG5kNWJLMVNS?=
 =?utf-8?B?TC9EUWhXUkw4Z3lOSXRhQ3VHNHBBeEVHKzY5ejBVb3hPdmk0T2Vxam1RWExD?=
 =?utf-8?B?eVdlUWpiQnJ5eWxzSENkVUJvYWlEZkZNZWNFQmY1cWVqM1ZDdkRuWVYrYS9t?=
 =?utf-8?B?SGJjcXkwUlFJYmJ3bjRQcktXZXVwa2s4emE3NjZUR2toOVZ3L0dqRjc3d2VM?=
 =?utf-8?B?MUt0UHdsMDFSaG1MTi9tb3RZYlN1bXVqSEd1a0YzbmM2QzN1UVJBOXowSHZU?=
 =?utf-8?B?WUJGR2ZiNlZocVkwOTVDUjk2Yk1DSG5qTWU3cUhvc0hhTCsyT00vUWdEZXoy?=
 =?utf-8?B?REQ5WTdYUDh3OGlvWThwdkJlVXdadWlFZERCTmdnTDFEOHc5Sjh3TFlSV21a?=
 =?utf-8?B?VERiVDZjOWhqT1QyNHdKeC9YTFZEbUFaUVJDN1FrOFVnRlg2bkVoSEFRbDVR?=
 =?utf-8?B?eEJDbzZkb3pUdUZMRGMwaXptSmh2YUpXMEFhMXUxaWZvR0x2K3lsSGZDdjV0?=
 =?utf-8?B?aFp4MUhjMnRSTUZ5cWNZTXdUTWpqT0lQLzJrUUFLV2tKcU14UDZYUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d189f2-7cfc-4170-7d2d-08dee8e6fd23
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:19:52.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8y9OaDIfYXXsFJUjAnmERre802S4Pbw/SXuG68cJMZgryybpDknNuvcEQeo/HZospbqLeKZTBbyc7jw4jq3fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2549

From: Nicolás Antinori <nico.antinori.7@gmail.com>

Modify the comments in the `pin_init::zeroed` and `Zeroable::zeroed`
functions to cross-reference each other and make developers aware of both
options.

This also adapts the example code in `Zeroable::zeroed` doc comments to use
that function.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com/
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
[ Fix link. - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index ef9f20b11034..1f5005c110cd 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1539,10 +1539,13 @@ fn init_zeroed() -> impl Init<Self>
     /// Whenever a type implements [`Zeroable`], this function should be preferred over
     /// [`core::mem::zeroed()`] or using `MaybeUninit<T>::zeroed().assume_init()`.
     ///
+    /// As const traits are not yet stable, [`pin_init::zeroed()`] can be used instead
+    /// when initialization is required in a `const` context.
+    ///
     /// # Examples
     ///
     /// ```
-    /// use pin_init::{Zeroable, zeroed};
+    /// use pin_init::Zeroable;
     ///
     /// #[derive(Zeroable)]
     /// struct Point {
@@ -1550,7 +1553,7 @@ fn init_zeroed() -> impl Init<Self>
     ///     y: u32,
     /// }
     ///
-    /// let point: Point = zeroed();
+    /// let point: Point = Zeroable::zeroed();
     /// assert_eq!(point.x, 0);
     /// assert_eq!(point.y, 0);
     /// ```
@@ -1582,6 +1585,9 @@ pub fn init_zeroed<T: Zeroable>() -> impl Init<T> {
 /// Whenever a type implements [`Zeroable`], this function should be preferred over
 /// [`core::mem::zeroed()`] or using `MaybeUninit<T>::zeroed().assume_init()`.
 ///
+/// While const traits remain unstable, this function serves as the `const` version of
+/// [`Zeroable::zeroed()`].
+///
 /// # Examples
 ///
 /// ```

-- 
2.54.0

