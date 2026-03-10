Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F533EB819;
	Tue, 10 Mar 2026 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130614; cv=fail; b=W2aWmUE+49c8i00FOf5dsgeh6JJ1hxoKiKy+jhfUSVXlKAZlFGY5vR4L0s9bAmcExXTkl2RFGyjQXogJfLd5Oy595Y4uPcpHEC7sy4sLS0LkA4FyS2zN+dYklTYmdWmYQ98WUNGpzXi0QKqL8t7NBr0D3rsiaSR8zP8T+JztVyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130614; c=relaxed/simple;
	bh=Tzg/HG84XhRFTzErGkqLuBIOX8HaP8/jPiZyryyOmdo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sHFVAwmYpQ5Xzqlknq9lWxOeWXFutEeT3neJqVj1glLFqIM8voOfg9uvyflm1fKm8qaKGIgwNkZLns0qgMEk1BjNCi8/5TXYLUKi5uPFOGhGsW4L84HOR1iRVv4cHzL39+bfNqq5+AOE/tWeqOQnHYK8r9QP4FnpUpGT/PhKqZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ueyULfIO; arc=fail smtp.client-ip=52.101.56.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ueyULfIO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlcrKM5RPoCH9YIMSOCeBZnfsleE8NX5DonZSLq27oQsBHJquF8cuPribkLlUTmAk8Q4eVX4XPrxh546yzjzqlDU9ZK1iErYEymaZ6t8HMwj9WqnS0+60TZsDq3X0oukKZEhjV9/JnwSVkD82hRc1kPOQajuPSL6GjAMYJH5Jcd8BAWDiMW6elhqEq6P3Ion4B5I7Zd9fFS+zH4DTdPIHc7HdnSVRdYNUUUVSNGa68F6absZ4SOC+BT2ZduUPNVB1cEVSu1IgXDzbbiV9mxtGoE+ZQ9x3Mp2ncr5BOhmp4KPCisNzzRhuvw4ukRG5W2ahAO4/vnaMCOkKicBHcpTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qlxm/LlCzCweNqeQ7heMcbfk24hOiVRPRrb0hPfZAg4=;
 b=TZOJeiHlJ8mRPaCC7BwyuNGZPqIDyaBTHbb8Ms6yiKdrXHPaw5DJ5xTNc0471iaA8t9GL6Ao0DASLFOmfe1bjfoqPf9RfdnZP+r9dC5EOblj/bxMesk0ArVEoirsDtrcEQiAfCKgb2kVAW+D+MirwNiiUo//BKppx+Nx9l2ZGNcAJRmMhVzaUwt7/QFKiZrwhOEjw1AF1j7t9GD4mLuVNg3EZR56xKKkutWhR34i1KDmrYSs+NJepMg2MfYQDVtqdhQ8XUMkBrKAEQVEhpTfHQxvaCnlG/gfbHKEwcmDBqVz0oKe1enNGjL2CGSSW8IJ3zwkitEDHfS3r/SjrLpVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qlxm/LlCzCweNqeQ7heMcbfk24hOiVRPRrb0hPfZAg4=;
 b=ueyULfIOsgFmqxbnkofKCtAzoE4lyCG5FSeu3z5pCnok6eDL+ubzo/N2atjU1PnUbKW6KwKxysDLnGpSdxkLGUOmRtQbm8Wo0PPBHPDWQU33ocYtLFD5QMUAACL1aQ2NrSb/Qsri02Itsb9X0s0CJEWxHRLc764QkyD5ysV8dGirqnGLjZEbZpQuFBOMtvYeuUaigl3bQwP8+3DJxpiv6PxH3enZxu0CyzYdT1DibZMgWwkcj0D/VkA//Gz3hDczI+ypJI+uRo27IwyFVGW2fabYpfn3UeGkyh5XsqDmLqvtOFzUfdXe1Ex4t4DfWruZds+j3zQvS5hrjd6BqFYZwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:16:48 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:16:48 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 10 Mar 2026 17:09:15 +0900
Subject: [PATCH v4 1/5] gpu: nova-core: gsp: fix stale doc comments on
 command queue methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-cmdq-locking-v4-1-4e5c4753c408@nvidia.com>
References: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
In-Reply-To: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b566a1e-1ad3-400e-ed29-08de7e7d601f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	c85/iwSPCEUhaVs+Xme2hnsGDDZDiqeQZpdtBsMyzRG22gKllZCuuS+nE79RiMmPK4Wbn+PGYNAmMvD4QCNiQ5GC60kGsfLc6e1hrQYzCNfnn4opr+paS9kDT0YuKt2n4iLVo2Hkv9wUoE4Pkp/Zo9BTEfC2X+K5Od37yhzrlI2ANXkbpHnfFLaQjdBm4bekdGCq0+RIcy+waUkvXAj77cX6ZTdBT5Yfirivn6qNS6KR22lk6IPFgClCeAM0K358984WjZ6UJqFUzTK0o47dkQgs9uBFem19qpmc4uQtb1gurR5qJk3qmqQ1f4+TEOA3Wk0SL/ajpPcfYKnfWGF+7Zbqa4D1Dq6ylqORsRCgBi5lXtFqXMCODP4S4PVs0zWOhejgtCbqUBMKn9WIXOA7IvQD0wiXmuLDhNsiS7CXkyYowzW+c5kx9CW7cUGXP4dPH1oFl8THi6VqI341PNn+qlb0kpSbVkQ+wjac3I6/Cyt6ew3vj6jVEkqv98/RCRo3Ac0h1ADC5RrCvdOYOOyW0nnm29t/qn2aPu10X7Kzjw2bxjv6Z1tMcNPZYXgU1Hw2Q99qAK3KGGyoL8MrG66VFAP998LMv7+KcftUvoNR9pYy8BoAcp6cqJSaT5IXCxyUX1y+i1NhMZe37SzVt1vLfutZYojjOOxviAcoDwVaLEsCLybZse0+HKoQA7VvY3OypEcMPVddDDCHDleP2uIUYECwb6k6STs/elIJO16JQUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWdOL081dTRJRkxFckg3K3gzYWtUUCtFYVJmU2JZOSs2ZDhuMjlvd2RheWVj?=
 =?utf-8?B?WDA2Sm1NVXpnYmF2NnRuK0tKZkM0WG51VkRLZTJZRGRveVVDUGlGZXVvMTVz?=
 =?utf-8?B?MzJyVi9Vd2FIY2dabEZkS29JYzNYQWNMNHBrdnRKaUF1ZmJZM1pXenhRZXZS?=
 =?utf-8?B?OGtubk1DblVlNDQxWGl5L1l1OURMbHN3bTZMelFRa0s0ZlF3MUdlWm1SN0Js?=
 =?utf-8?B?QWdwdENPeUZURDVWa3VXZlAwSzZLaVdiSlZGWENIWTNzS2JYTm96QzRoOG82?=
 =?utf-8?B?ZERzOGV4M09QV3pvSzNWL3BOdmdLS2dqVUFMS2lqUm1XZDJ4b1NiWEl0L0dl?=
 =?utf-8?B?eVNyUUtpNG9UNThtenJ0NnRJd0lsUlNyOTFYV3phaUZoRDY4ZXdwVDJwczVo?=
 =?utf-8?B?MlpDK3NXU3RrYUdZeUhhZXpkbGtGSkQ3bm5oR2VnM3VHMXdnMzVXaVlVV2wz?=
 =?utf-8?B?OUlyeStDS1VHS1J1Z0QzdDlVWlAwY3dsUElPalM4SFJyelhuOGJhS29LRUJw?=
 =?utf-8?B?Q0J2Z2NiYTdpa0ViQUdEUnVhZHJ4TXFrSURReGV3QWwzU3p3UFZMV0x1ZzF3?=
 =?utf-8?B?KzQ3TlNpdVEwVENUc00vYnVzQkxUU3hDU1duYUQ1LzUrcmh1MGpmMm01c2VB?=
 =?utf-8?B?WHZwdG5iZllzbVJiQUdROUU5M0JQbzZDZkZiU2piTW5CU0JkMkgzVHgxMWFP?=
 =?utf-8?B?OTFVQlFlNHJCSlpIRy9NMnZTckdPWHpza3BCZ3NVajZhUWpaakkvbTUxTGtk?=
 =?utf-8?B?MkRmWWZ6SEhVQTJVamM4NXJuK0ZHcHdVb2hZeHNkNFlnRHBaeDRTd1JDZDlN?=
 =?utf-8?B?Nm1qYUxYdnlQVnVkUU1rNEVTR3M2bXNiUklYaWtaRHZwY0xoc1hJT0ErUzV0?=
 =?utf-8?B?MFBCdWxHYjFnbGsyT0NyVmRvSXJCZTlISE9jTlFVTnRjQVUxdUd2SHFRR2VJ?=
 =?utf-8?B?NGdIWTU0bTNnM0U5Mi93VHdseHZJYmZZU2QzQ1c0Nyt5S251dHZPUEoraHFG?=
 =?utf-8?B?dlZaRGVxZWh4OHVXelpJWUdUOGM1VjNmMjhFRmkvYzZEaGlwMUltVVdXblhv?=
 =?utf-8?B?bDlJVjV1ZmlZNHNUOXJXRXRoUDBOL3dYNXlWcmZLaTJZOU5nRXVULyt5M2l5?=
 =?utf-8?B?MEZkWXJ2YTZwNXJMMnR5cWFkZHVjNFo3WUJYTlZhK0duWkJJVjNIVG5IVGVv?=
 =?utf-8?B?QldBU0pXZGpvU3Z0T1A0SkVSaGRpQmcvUTlyOFJUelpWZEUxWTBTckJUdVF0?=
 =?utf-8?B?YW12TCtaYngvYk5oUjFnUkRCc2ZSdDdKbC9ZcDlGQzF2VVo0czU3OFJob0k4?=
 =?utf-8?B?OGNXZ3YwWmQ5NS9iWVJwdWpPYW0wbElZYVIyMWJ3djdjK3BHTXg2VFkzRGt5?=
 =?utf-8?B?UG9RN3lTMVkzZXUzWTIvR2gzTzI3Y2FQWEU4YlJ3WDE0bWJVa1Z1ZHhTOGtR?=
 =?utf-8?B?UWpPeG1uVk1VU2FibEdVd0VLVTVzN2JIWEdka0FhbXhDaGM0TGxIMG4wcVpP?=
 =?utf-8?B?bzdHY1M4bU1iZ2dsMUVvUDlzN05veW11MXpuL21OZk10UVdjQU9rQ3dXTW52?=
 =?utf-8?B?QzUreUdHV092bldMVnpyUmdOM2t0TU83UVZlaEc5VTBUTVUwamkyaHBxTWRJ?=
 =?utf-8?B?NVBjeXlYRS9SOHpUZEQ2MDM1UmgvNXN2VzlkU1p0RDcrcHlIVHQ0MHVvM3BT?=
 =?utf-8?B?aS9lUjVkcEROTm1nKzJiWmJ6Q05VR2ExZ21zSUtBcWQrR0M0TDc2SFlpUDBj?=
 =?utf-8?B?QTV4WlJwOWJyRHhlUlBuYlY4aGJlMTB5UkdPc3Y3ZFZ1NFArVSs0TmR1RXc3?=
 =?utf-8?B?NzBlc1N2RXJRRzVVcjlyWFViaXRodURyWTNQYzV4NHg5V0ErdEFHLzd3V0o3?=
 =?utf-8?B?WjExdkhoZnoySHZRTEFxSHpBMkF3THBxL0NiWWFDdWczSUlqK2F5V2d3bDJ4?=
 =?utf-8?B?Kzc5L0szdGMvcXQvajFucm1XVU9ReFV1eFZyWmdhaHVHRVV6R1RWd0hXNFR5?=
 =?utf-8?B?b242ZGtrMFdZYnFaZ1l0NDJRV0NhWnRnYXBhRUlMWGs3TTIycTFjako1dWM1?=
 =?utf-8?B?SVFTYTZMaHlsc2JqcGkzTG5hM05xT2hHQVVLSHJ2Q2tQTHlPTE9FaHdyN1ZO?=
 =?utf-8?B?MlV1UHB6dzBwOWtZMS9WMlU1T0k3Z1RXV250bXpXanFXaHJzbzg5b0xXZkow?=
 =?utf-8?B?Q0ZwdGIzUHRCNG05VDkxNUlSaEVYY0dFR2ZlaDA2YlMzMklzVWNJK3g5czBC?=
 =?utf-8?B?N08rb3hYT0xMemVIYzNTYmt6SmNoMTU4N2lKdDMwVmVRUUNSRzJMdXorOHRX?=
 =?utf-8?B?VUhxQmpiaVhLRlIvMXdWdUlBOUU5T09MTW1mOXBDNHp6Z2R4T1IxaVk5WlVs?=
 =?utf-8?Q?0aSTiTQ9sEat8QmMZHpWYpx4Ivd6f/lpZbjnp30GCT6kp?=
X-MS-Exchange-AntiSpam-MessageData-1: nkDFtnzb57uZew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b566a1e-1ad3-400e-ed29-08de7e7d601f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:16:48.4696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XvYBYfOtyB8r9fHZ1n9Nipqt36rEayn+BjHjGkXrdSqgshmhGKE9kevBi/5hGQ/z0b/42UCw4KtQnWhyj53gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Fix some inaccuracies / old doc comments.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index e0b096546d23..cbdc76a33a54 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -531,6 +531,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
@@ -711,22 +712,20 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// `init` is a closure tasked with processing the message. It receives a reference to the
-    /// message in the message queue, and a [`SBufferIter`] pointing to its variable-length
-    /// payload, if any.
+    /// The expected message type is specified using the `M` generic parameter. If the pending
+    /// message has a different function code, `ERANGE` is returned and the message is consumed.
     ///
-    /// The expected message is specified using the `M` generic parameter. If the pending message
-    /// is different, `EAGAIN` is returned and the unexpected message is dropped.
-    ///
-    /// This design is by no means final, but it is simple and will let us go through GSP
-    /// initialization.
+    /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function of the message was unrecognized.
+    /// - `EINVAL` if the function code of the message was not recognized.
+    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.

-- 
2.53.0

