Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E814335547;
	Sat, 21 Feb 2026 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639877; cv=fail; b=AYldZvgLEffH5atm+h2ufTgWDAINMr375qfAcmgJjk71jwZyPRuELJmwK1kIo0ajSqladKCAiuz4Dw7goEAIsBfAcQfht0Kcllxi0sVIo4K0lQxJBWBKeMbqEDPrtdPGf0BDmvqCfFTxInqQ6/lb4M+IVMOicGinKM2vuBq+Z4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639877; c=relaxed/simple;
	bh=L17fv4lddZByoHdQBjFDYwYYChTh1eFwvaMV7GiAhmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KMx+V+oXrcdliCgwlXuHJmICOq4sMBJa5kSWF+9OX/6JsRWWIC7HMjWapJs04eQe9oSLlyzrtSFUT5D+sHHKh8wtQ3EZ2V4QOA77/Qozk6sE6Qipnol+UFDi55CdAX0FVUy3aVbP6fCYNfkCI1b2X2Kbl5V+wrM1S352/xpq08E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JxdPoQMs; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JxdPoQMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMfQNXHAgVc3Z6FJP7pRcnXSoJE5l7xGpgiFxi5DunrUerDNisJ930WPaXLWi0DAChn8N/B5LMPClDXHmhYuh3tfTKPSkaFBgEq2UV9TFSSORoly/8KXICa+jwdAsiSQ7MjV6724f/eEKLHiHEuGvRdSyBVxRjnFITyIRIrbl/OfjkYiHc3IfNZnogVq2mIGHTrsI4tzEWnlwmQGuNI1z2b886WQ5Zj6iMybRoy6t+uCKSdV7BSVJ2B/BwElM8aCQ7uW+vp0TUizHdfWMTdtLocksjsjzzSWhE6xm+GtgxqPO9oiQ1OhfvEsxE+lVF7btLo+A+7Up3iRKyJUlCpeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg3pmjqEw/ruiPsg2UsmwGOX5sKPA38C7hEUjPR40/I=;
 b=AHIzYEaCjkxzo++oa+Od5rd2eH0f/ij9fEdwinSqLFlPkPX8WBWoaeZb3cY8WW24bBCCfjxAETq4LkojWy3Wn6OTAgmKHc5OU5QKh11TPH4WOHRZrFcVPxQTbtqn0ULwz22JM1MVf7UEhPG/nn/3apqSM1MSyD+1oGlPBsAVt9/pwai8jMjvmTbuMh0fzXKbJw0ua0Zf9azB3TQ/MFRN3aPK/sAvoF8KzZOQqtN5czccHQau6ooSyxUZQUfMEBoqC4vbbpfY9XhHkWhjKGvAu+6Pt3makCL8PgEDS7tEfaeS2xuY3BkHTj5yHEPENp+BbRsTVkU1n2i2Q6JJOOJ9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg3pmjqEw/ruiPsg2UsmwGOX5sKPA38C7hEUjPR40/I=;
 b=JxdPoQMstQZ2NSQj9T8dkR7DSO2ITkW1U1id8Vwewdj90U8hXslIicvs1l/oLqfcQ+d+YYSzpuntaY7+PFGxD+GkfTsjp8c+7yQtAG9H6cC/iKe5WgcSZoDTONG2vpGFn2eVA8epekPgJPY0S/4Z4N+T4WnB00Nu/iVUT1pBx4ExlZOayA82sKc1ovTFt3DA5n80hgsQygu58r/YVudAEJ8r7k03V20RxHhcu3Ow3trJ6HdmZxSSw4qUmXii+nenk3nt2UBhaM9lJa2arZJop8W7Ldp0vgXL510DfhPZhNzU91Lhp4LnQqiP4Da5VtyKhoL3Q+0dxCcm6z7mv+eqxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 02:11:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:04 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 36/38] gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
Date: Fri, 20 Feb 2026 18:09:50 -0800
Message-ID: <20260221020952.412352-37-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 5596b5d6-1e6d-416e-d6e4-08de70ee6842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Dv4dSF7xYZXqnC2AxTV4MnS0Tr7G9AfV1nZu8LwtJdMWYxfA+ETrbeYMJ/x?=
 =?us-ascii?Q?cXLFZvheTL6Oi2nrqFsHQDx3JigRsP+17B51R0ViJh2Jn7M9XVsLkTcIs/BD?=
 =?us-ascii?Q?iMDSpzbvlXP7OvvsQ26Y525zHIZ7IrNxXFFK+YAJ1mnJH2XvNR5LvPSZE0AO?=
 =?us-ascii?Q?iY7HjcVOVzd96TLZAzcYPyklL8Xcl6pSO90rVyiU0CWMNQxcf3130oyoyWhl?=
 =?us-ascii?Q?7MjI9Osd5hKgHykTd+nFSmpr5UBGF++2+NpL9gKf2qh6Pa5Ye59foxx1I04G?=
 =?us-ascii?Q?jIqtCzoz3otmhDQjIkCULIwhDcV5WIs6Dhm2P1vaXVPlOA+FKuJOsZ/IAhhw?=
 =?us-ascii?Q?pgc7ClKD06KeuUDSgcRs0U8AvHPw84JvjEMgsqxtizORwhwyz9SnipL8mcry?=
 =?us-ascii?Q?1UENYlg5MLQ1seK3VzIhL548I8ofYCmaJnH3X012wyQq2mW7nQpJKgWhF9o6?=
 =?us-ascii?Q?U5rDBNXA55iPRfJFNUNefYLZOeo7WyUHXb8WtqZTzrHD82ZyT6ERDkTf6qel?=
 =?us-ascii?Q?tpT1pV2J/1T0sAb/Jt8t08ElKKGimkp+PlHisr/hXz5v8stXTqA0S/PMthMe?=
 =?us-ascii?Q?xtmWDf5sYgQV+U/x0C5oaoflxjCMz1XTr1Y3pWp1PkGILsOa5HwG7qAl1CaH?=
 =?us-ascii?Q?gMCfPMeWe/6eCWsKsAgPrGwdUTik4ayjYKmBRFkgHfjJX/CkRwz1PbTmtK1Y?=
 =?us-ascii?Q?jPDdRci5Z/2IQxkuqC7Xg7wUt0Z1uuB8/6SAgXJiTulImilU6ztKfKakCgLS?=
 =?us-ascii?Q?E/o5D/b/XRJbPzrW8XbkZy8PdJEKeNnRSMZG8EPNsekJJ5KsZvh6g8myWYSI?=
 =?us-ascii?Q?5eqDyT689Pmjf5aoJSKzq/K9a/7v8PBKLnImsflQZoXx1xAk42Bk6tGY+Wqq?=
 =?us-ascii?Q?dSo5XcmAl29lRWJmNXjyGmTRYriMKV20GIlnVpg15vs53S8U8Mm2YZ5c63qD?=
 =?us-ascii?Q?WP7/KayHeRopgrrSKDkye6t/95yBvYL8kG97+kQdDvojAsKIkRZQE6V3Y4Q4?=
 =?us-ascii?Q?A9a1WCR/NqOYzkJgASg79LQ1hlEsccl3YYi02VZ6Ubkdusw6tIll+xEKHxUt?=
 =?us-ascii?Q?whHjQn/sUdCSc5IF7Yx94q2gfwhUtVOhhDNGFcGitNRo+DqBmvH46TazFyku?=
 =?us-ascii?Q?v0LnUIBianE2RKH1arZBqq9juqAcdxRfybKH9DETt6IBurhhKafCBH8veGnl?=
 =?us-ascii?Q?iz9Uo5hlTWv85xl5EX9Ye4cnxBZ8IY1+Eq8M8g/B+0xYkxYrNa1sfW4RnkfB?=
 =?us-ascii?Q?jxFebA0tAnQWVA9SGI3iiMA4pwNdWXKTGEATqrXHUELUrvJuYvmFuEVH2A2d?=
 =?us-ascii?Q?L4zhvTWNhE58YNooDxPcD5j4MaqhEUGmQERHWO6WWXcutdZ+1RO4xzm0jBdX?=
 =?us-ascii?Q?0xXOng2FkjWfmWgU3YCzKFl18qaNapz03lCUXKCuhR6/xJGCAgkoVQCcckle?=
 =?us-ascii?Q?c2ULWMIm14nNo0bGO94h145nMUkfWg/U2oNZzgGCM2GZ0k1G/tD/gN8diYX8?=
 =?us-ascii?Q?hB9YwpETHlEhFcgvrUqBKa2ReZ0krZHcs7F4t/wb7ALcfrtx94tTzFYHjN2t?=
 =?us-ascii?Q?zdQxzglx2orDya7bkqY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QPGeEgfZDj16XFBMvM8FyhqqZtHwkqmfyn8rDxzqh8geS/NcwvRggi8rxEq/?=
 =?us-ascii?Q?FHgEA9DbnWsd6H24GSZ2G8yQf/wQ6eYaY9cuDtoPnrT2XnnZQa4nt/MKP3YL?=
 =?us-ascii?Q?k+rcnS48ozhP+JPWnFqKJ7GYgbtwoaT2HpreMPgWaPx/dxZAfpU51ewqnYmw?=
 =?us-ascii?Q?kFw+3LKes+KuQ0TfIIxDn70UU6IcPn+LwvISOmIX3rPCb7bk3wC5Og9tQAhc?=
 =?us-ascii?Q?/TvOjxzZ7mjK/3s8kty6k57LS42GzYG3NEKu5lgIK0oOm8U9S7vzAVaplRxN?=
 =?us-ascii?Q?xCIYtRc3Zj5rousYIhBNRxE69uXBWXC0wLxZfSwXvS9KzVC+aenKuQha9yGA?=
 =?us-ascii?Q?kc2TRpP6Ku1BRZuHsNKe/Tdn4UEy9vvvEfC3ZuDS/7WEzk1Bk1rEDZvRMJJw?=
 =?us-ascii?Q?YZFgJ9xFriXRSn7ECm9U/+IoJFAe0aCEy9qkXSQ62l0K4z+6QVxzm5Mpvkae?=
 =?us-ascii?Q?Ziv21J3+jCnz/wvX4Y2QyB/qeXzuycChdCUSQKEZUmvWP/pidg5oEZ9fgLQF?=
 =?us-ascii?Q?vkuawCmy+NISylbnawH9g5ZrJrpL0tGsZ2FZe479Y8m09ehmVnzkpAAb2tfo?=
 =?us-ascii?Q?R1wE1+jGJS0N+k5fpmed36ZCYrPAkN94A4nv97TdKEhTjN++O8NWguLmvErV?=
 =?us-ascii?Q?UxDyNpqAoP0kXMbEvbzJfdSITyK/u4lY3k9HXn62X2aSDLi7xNN4s+IZhUMy?=
 =?us-ascii?Q?m9Qh65TZpr3Il+AERCfvl3vicO5zKGyDW1KalwQsKtwUrhpB8UT4l3hXZsh5?=
 =?us-ascii?Q?XH5eUKPgvw5cPnzn4KB0mBYdI4oOOuFyiOj9R4ILJ/Ij/4mWJ7Icpm5Km3/Q?=
 =?us-ascii?Q?y/yQFrWRe0hjrnYyPdIIVZgqVoHpGPatkwZ1h3k8xkyIIutxbBiOk1L8vZpA?=
 =?us-ascii?Q?xsKfzy2qLam0J37Cs8YYjv9EAmA1U0AvMyljXzEc0To+fNEhmjzlGXNUrz4L?=
 =?us-ascii?Q?V+vgU2cNq6i0nYix2sn4jmREZ5/cEIGhg3H1NMPgk5nqMR/4cIIRf28+dM84?=
 =?us-ascii?Q?L5SkMZWTR28pZqxgZ8gUUjbgOdENSVfs3yno6i/o67GRYt4ELHF88LJ8D2Ck?=
 =?us-ascii?Q?MYFy0e//8Syb9xao2SfAG2ZoBmIcyoi/ez6/FeKI9MJ4SXS7en3szT9gZ626?=
 =?us-ascii?Q?OnKGQlfYxbgGB5KjTxH1ExsmHxxQ9WFZ1ECVWI6Lq9hS94PKs8tYgm/3O+WX?=
 =?us-ascii?Q?27PqoL/hJwK3/I+24/GtXirD5gIaPA5c7qlaCh1ahgB4LPkVa+MSPEzN8PF2?=
 =?us-ascii?Q?vjkiM2RCB9xrhqG3anSjsDPU15k/I+qim5lezKqK6fMr8sM3TLCj8IHDV4/o?=
 =?us-ascii?Q?5YONaW+Oy6BrIxgxeEZncgCiFr4G0fJBWrAx7QM3pud7QOTL0OJxU7JA0OiJ?=
 =?us-ascii?Q?0o2yqlrpU0R3lIqMEPyaj8ov7nnQzSky/12/xDwmOBVE1lUOsE7lwihRPNSf?=
 =?us-ascii?Q?RXtwtP/He/9n3tNbcH9cUOH92k2RtUtaeYy1MtiodvzPT89hNNx339zUTbni?=
 =?us-ascii?Q?XWd1dCTt+O+jIdFreEY4w+TO9Wy0SkSueEqvl9ejx/+S1rDGW5pO32bVaAx2?=
 =?us-ascii?Q?8MqyeVyrmQG3qazqU7GIi2vEcD/z0Q22Bf2nxZkuTFjmpl1iUjEl1y9y2ZYW?=
 =?us-ascii?Q?u0v2W2lqb6JwXvdW+mYT5UBexHbXbg088+9RMK/FgmeKUQQFCqtDVn6Kdac3?=
 =?us-ascii?Q?rUMN+XhQKjxOixFaNCbxjIfjbsL+ewwSMJFAGygHJxKI7iot2JxAqHCsRw2V?=
 =?us-ascii?Q?fxP/8ER6+g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5596b5d6-1e6d-416e-d6e4-08de70ee6842
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:38.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSWAztKl/uVJsTeKuFArW5eiM5XpCrTr5cHy4SsaQ6UxZ6MD5JVcHoJZ/VavVH9xjsHlTkZ7rmPSygcBkwPWIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378

Add the FSP boot path for Hopper and Blackwell GPUs. These architectures
use FSP with FMC firmware for Chain of Trust boot, rather than SEC2.

boot() now dispatches to boot_via_sec2() or boot_via_fsp() based on
architecture. The SEC2 path keeps its original command ordering. The
FSP path sends SetSystemInfo/SetRegistry after GSP becomes active.
The GSP sequencer only runs for SEC2-based architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs |   2 -
 drivers/gpu/nova-core/fsp.rs          |   5 -
 drivers/gpu/nova-core/gsp/boot.rs     | 190 +++++++++++++++++++-------
 3 files changed, 144 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index bb35f363b998..0e72f1378ef0 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -13,7 +13,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
     pub(crate) fmc_image: DmaObject,
@@ -22,7 +21,6 @@ pub(crate) struct FspFirmware {
 }
 
 impl FspFirmware {
-    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index c66ad0a102a6..3749b5e3a677 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -238,7 +238,6 @@ pub(crate) struct FmcBootArgs<'a> {
 impl<'a> FmcBootArgs<'a> {
     /// Build FMC boot arguments, allocating the DMA-coherent boot parameter
     /// structure that FSP will read.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
@@ -287,7 +286,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
@@ -301,7 +299,6 @@ impl Fsp {
     ///
     /// Polls the thermal scratch register until FSP signals boot completion
     /// or timeout occurs.
-    #[expect(dead_code)]
     pub(crate) fn wait_secure_boot(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
@@ -331,7 +328,6 @@ pub(crate) fn wait_secure_boot(
     ///
     /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
     /// Returns signatures in a heap-allocated structure to prevent stack overflow.
-    #[expect(dead_code)]
     pub(crate) fn extract_fmc_signatures(
         dev: &device::Device<device::Bound>,
         fmc_fw_data: &[u8],
@@ -391,7 +387,6 @@ pub(crate) fn extract_fmc_signatures(
     ///
     /// Builds the COT message from the pre-configured [`FmcBootArgs`], sends it
     /// to FSP, and waits for the response.
-    #[expect(dead_code)]
     pub(crate) fn boot_fmc(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0db2c58e0765..1fdcb72ce163 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -24,6 +25,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             FwsecCommand,
             FwsecFirmware, //
@@ -31,9 +33,17 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    fsp::{
+        FmcBootArgs,
+        Fsp, //
+    },
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         commands,
+        fw::LibosMemoryRegionInitArgument,
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -188,8 +198,83 @@ fn run_booter(
         booter.run(dev, bar, sec2_falcon, wpr_meta)
     }
 
+    /// Boot GSP via SEC2 booter firmware (Turing/Ampere/Ada path).
+    ///
+    /// This path uses FWSEC-FRTS to set up WPR2, then boots GSP directly,
+    /// then uses SEC2 to run the booter firmware.
+    #[allow(clippy::too_many_arguments)]
+    fn boot_via_sec2(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        sec2_falcon: &Falcon<Sec2>,
+        fb_layout: &FbLayout,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        // Run FWSEC-FRTS to set up the WPR2 region
+        let bios = Vbios::new(dev, bar)?;
+        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, fb_layout)?;
+
+        // Reset and boot GSP before SEC2
+        gsp_falcon.reset(bar)?;
+        let libos_handle = libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+        dev_dbg!(
+            dev,
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        // Run booter via SEC2
+        Self::run_booter(dev, bar, chipset, sec2_falcon, wpr_meta)
+    }
+
+    /// Boot GSP via FSP Chain of Trust (Hopper/Blackwell+ path).
+    ///
+    /// This path uses FSP to establish a chain of trust and boot GSP-FMC. FSP handles
+    /// the GSP boot internally - no manual GSP reset/boot is needed.
+    fn boot_via_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        let signatures = Fsp::extract_fmc_signatures(dev, &fsp_fw.fmc_full)?;
+
+        let args = FmcBootArgs::new(
+            dev,
+            chipset,
+            &fsp_fw.fmc_image,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+            false,
+            &signatures,
+        )?;
+
+        Fsp::boot_fmc(dev, bar, &fsp_falcon, &args)?;
+
+        let fmc_boot_params_addr = args.boot_params_dma_handle();
+        Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
+    }
+
     /// Wait for GSP lockdown to be released after FSP Chain of Trust.
-    #[expect(dead_code)]
     fn wait_for_gsp_lockdown_release(
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
@@ -233,45 +318,49 @@ pub(crate) fn boot(
         sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let dev = pdev.as_ref();
-
-        let bios = Vbios::new(dev, bar)?;
+        let uses_sec2 = matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        );
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
-
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev,
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
-
-        dev_dbg!(
-            pdev,
-            "Using SEC2 to load and run the booter_load firmware...\n"
-        );
+        // Architecture-specific boot path
+        if uses_sec2 {
+            // SEC2 path: send commands before GSP reset/boot (original order).
+            self.cmdq
+                .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
-        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
+            Self::boot_via_sec2(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                sec2_falcon,
+                &fb_layout,
+                &self.libos,
+                &wpr_meta,
+            )?;
+        } else {
+            Self::boot_via_fsp(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                &wpr_meta,
+                &self.libos,
+            )?;
+        }
 
+        // Common post-boot initialization
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
@@ -282,22 +371,31 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev,
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
 
-        // Create and run the GSP sequencer.
-        let seq_params = GspSequencerParams {
-            bootloader_app_version: gsp_fw.bootloader.app_version,
-            libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
-        };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        // For FSP path, send commands after GSP becomes active.
+        if matches!(
+            chipset.arch(),
+            Architecture::Hopper | Architecture::Blackwell
+        ) {
+            self.cmdq
+                .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        }
+
+        // SEC2-based architectures need to run the GSP sequencer
+        if uses_sec2 {
+            let libos_handle = self.libos.dma_handle();
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: dev.into(),
+                bar,
+            };
+            GspSequencer::run(&mut self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
@@ -305,8 +403,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.53.0

