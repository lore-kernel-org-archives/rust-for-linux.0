Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5593A2DB7B5;
	Fri,  6 Feb 2026 04:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351714; cv=fail; b=TqS+4MhEZ+0359l3tnWtqYXTZim7GtZwl4GoyA/VsWPwOHz/wtg7o69CvRr3ZBJs3znvL1Dta9hv1Om6HxzxRylqJbe0VaIlG+WNOa9hkjrfzerUXGvwpfMAHpyEKiVfIjn53DzaMORw5/0KY6Eb93Jr+8Mb7yFv77MUI13cIpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351714; c=relaxed/simple;
	bh=lmCEX8MFpeNpOOLdB1NDzwiJdEnM+O+BEeqIVD0pRUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mh9vZ7ze1kJ6EFuyYuzKnvwWjADkVaKnjvz59zrN6ERPhpUhZVJU1PrtaDuy507kHXCZwVPUmuU42sEra7yf9y34WmCOdi9tCibnT3SIxFVAPp4oph4G146jv9HNrXR1sfattqwf6h5qyl6tVYWJNHahC3upm+1d7gmHpe81sAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EKuHDuFK; arc=fail smtp.client-ip=52.101.56.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EKuHDuFK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIc7dYvRkHAzjSk5eHwb8wPfC9M3B9b0ActsZ4h8migCBvxomqF46kp9QKJC+ioejBl8qT1nQR33ZoUTBXVD7oeEbOqbwjotbb8wbqbah9yy9t0rrpXhAv0XaW2Fs7h5Urp1lC3WZKTumYjrcRrETetqwAoGvr/me6V/enEwn1Ig3LZoPkh2f3Up93fXC4jQ/306InG04V9Y8WiI4e+mbumb8M1rDpdib5EJ1tzew12fzFrhtcFms7xcx3Jfp2oPH1oJIRDH2o0XYpjO7hhbUSuiByOLk2337/WMHhKPoZIdZK7NmuWymU1AoVOhOObWLKcxtd+bp1iRQRmpgkvmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhNDJ9mOeld15r1mL4NIlQ4FOXnvVOQyNQuswVvSl3U=;
 b=tMlQ5RZJsJwM4wBUxexSZ+Tc2RtqUFn8NtVyyB/C81af1BZ8kHKX8PfPLbCot5gE6qp3CPflhDF7yB+ZD0mjmCkZub8q0updhb/hNTWsdESgGqs7wM3O2ROnB0gEVb7mC7NL4heMu6l9M5buiJ8a/J8TZbuS4wnIvZKfKPy6MQk5kH4gxOC6ab0r8hE34ySomrin95jQ2XgGhaZ9fYQFSZWryz6CHWBjKuI21o+rEwVW1V1KjEnW0/ot3oEDHYP42irI56otCnLgEMGFeD5FjXQhvnjzNWoWxNhXl6JcogANLkqH5Z6LPuHTeIswG2Cs/nokMQ3sMFU1BJOZcKX86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhNDJ9mOeld15r1mL4NIlQ4FOXnvVOQyNQuswVvSl3U=;
 b=EKuHDuFKFh+oUspT1jyao0ZdKQoOgxnghXPbbe6KNdTM+RDetj4IT35Fs50RcipQkmWHxjfUNM68aYFXIxULTQQjT0bAAxkMl1hiLhJ8Vo//IaJZURKZtRONbqRdDpLvLvT13bnKZQtvr3ZeuL8joF/iQKDdzN87hVGUSJACjdEidP8vh+wpAOL4y10gc799eEtncZmOHhCb7aNtvPG/xbkYlSUGGpX/hswn+e8ueyYl/BSGm5LddYPIgPesi2j5L0NPGmxYZVqE9sxUHe34mdqvvb96Wiu0OsKznX2xYhowDuJ4e6B5nb6bSvMFq62Dlaj7zZ/+4WWIjImkXXMfyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 04:21:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:49 +0000
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
Subject: [PATCH v3 17/30] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Thu,  5 Feb 2026 20:21:10 -0800
Message-ID: <20260206042123.303281-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 02065a8d-7684-4247-3ef9-08de65373e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LNTdlnEN1FWnvAXgDfW3TGnzSWRXnSdp6p09UejXJyaZ9IVFhwyaM/l/AO/u?=
 =?us-ascii?Q?kUei1SpS0/vMHbPMW2Q8KbkTTcNRABi0KqAAlBWSPaczojSZwKtMGSG4+cxq?=
 =?us-ascii?Q?Bz+pTB8AstODytfY+JLbZr5z8/KKfldyZLES4kRf+iwOhK3pVbew+UBk/2JI?=
 =?us-ascii?Q?HqOLHGRwCpjZxGgevXZ/kN+EW2cJRrCL4GIhdZm1Cu4H6ayN7Dd76ovdNx67?=
 =?us-ascii?Q?VxIDWu/9nAaL3hDCJ6lPluXwAz2GSjEPFG/ruWqGVQWg7HtN01Ckts68cJGU?=
 =?us-ascii?Q?LZI+s7dNjrFbaKvDIFE5EJhNxV0G5YdbRXmAtwdxNDpMvqlYTFpxYm3RvbVp?=
 =?us-ascii?Q?I9MyZBmfw4mpg/xDNXK6qtDGKOe5X5PFtkuuPeRaXXQLLh4rDBaao5i2UtCz?=
 =?us-ascii?Q?2JaAZe/dc6EVIc4LnxLv9J6zOT/+0xxrU+alROUEq2Khpj8klR/ex/1veplc?=
 =?us-ascii?Q?gHShTtYNLpJbKlsiYOxIioN+grq3G+QNavZWSDmFT1q8A2oMgJ2ohCZEDAgo?=
 =?us-ascii?Q?ztns4uQQVA1JQAK1TFG7ugIUJC5zCZmiISbJRXhLlMkjfykMzQ54Bqd7PZef?=
 =?us-ascii?Q?OBJuRBxPdy1/1DvHxk1SkRRd2/2q5knH/QjUp4oJ4DaMl4OvKUQZR0dSrwvU?=
 =?us-ascii?Q?Rfk+XbGGwuVE2Qj1GV7bikj4wl25OkUqQDaN8KgvLYyBAaazjlFY5za7+/9L?=
 =?us-ascii?Q?tgq5OznvElUNsUEl2dbAkukd1tcYLqRIy8zAXYI0nCg5MfJ2XY6pdmc4YR1d?=
 =?us-ascii?Q?fz72yyWgUOSYiJZEQCJLaDhuaM5OscDGuHiKLJr/9xPlkk5ae/U6t3ZXuUBe?=
 =?us-ascii?Q?vGy/zZodgcQKtB2fsFmIOPNQQuiSeKLkSxN+GnwAqVUOm9xGoOV4d8QZFSuE?=
 =?us-ascii?Q?3K7ry8Ls/yRjzNuG+S2vPie0RSHINqakdBAAYOd7Pzjo+mF4XqrBq1naEVuP?=
 =?us-ascii?Q?B5k+gd9Wm5hy7/3JkizeyV4UiM2wNQKJi+2KvrP3JoAdpapH0TjUiv5xVT2E?=
 =?us-ascii?Q?VDhUl81NQKtkI+5X3pZHZ/uadqrBvkFdBkrlh6M4uHloFxVrcSkNEvDcFZSm?=
 =?us-ascii?Q?jld68E4G04aJyTD3XVPnU6TjcZNR01m17OjGLj3Aj6JeQiDpDEnge3inFIUT?=
 =?us-ascii?Q?5LT/6lUFD13pisTxMzNuLmZKbF+a4tVi9+7+jSYCtFWFDKjjhXxfe3PMgyGo?=
 =?us-ascii?Q?fT0ucvCdtrpXBWFiXRGcqSghdEbU+5kwLMTQjHvEGrz8U17WGj0N/ImZk5mE?=
 =?us-ascii?Q?GNPkrRc9wDG5JOuDoeYNiesNmfimVRtKQkg1xYPFitDfdiiWZEnnVuOmkzzU?=
 =?us-ascii?Q?2qpVBx7KLeTyulnbQABVSPx21qP/37wLb8h6i6y2EVxZm1bDxPBoZz+xuSlV?=
 =?us-ascii?Q?MUYONdeDTFSg94Qo35NtQHC7yaYDVNBHeMbbBAfYxQ0t/yAZMIo1/YrXRgak?=
 =?us-ascii?Q?LpVEHOhf9p++WKndR0jdW65CC9a09DzwxhlLKtZwgrr+LwOUqUsh1XtcchJF?=
 =?us-ascii?Q?igjiHKgfRReOGh39ZWNIgmyRu/YX4i2shScMttVtgj5Tmg0IoPf12MSBpUf5?=
 =?us-ascii?Q?soPoGumgCJdjPH33BkQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y2hROa0Bs5Y61hXemFG58Tk2WBbmHuAFLiu56OovlU445V8AzmyR16KMlMgm?=
 =?us-ascii?Q?3dAK461BHqfPuIBXLRLUCLPplRptz6hwmGBKYunm2lrs1F7e45hQyaDIzusM?=
 =?us-ascii?Q?qhH75PfBx5bA2t2ITjme0jJ3FwKBG0tIGD211lVdkduXQK4L46HC8CTUqR8Q?=
 =?us-ascii?Q?GQ2jydjnFddMpPa/F0F1kxgdWFZjV9/s5GmvTjPcpRyTJ7VUhYIWEf6/5PI+?=
 =?us-ascii?Q?qxmF2ZPpKJhciBqCKGEyfWvqOc+wXZToWLuMXa6ZeneVhZrm/FnWzHt0diwM?=
 =?us-ascii?Q?hTglGXhdBbcCl4NKAx+cw3Y9VrVnwOGrvpt8EQqoO7p5MBEpsU9LrRMH1qPF?=
 =?us-ascii?Q?TtD8CC5m04yP6Ini8k9kac+tCrnb13/c2fd60pKqORAUYIHZ8g4sBHQbVApW?=
 =?us-ascii?Q?kD7BQ0CuGqXq11OjFCR8q62thsnnpR5G0owoNu/ZsXTqunny56PJazdaFDZI?=
 =?us-ascii?Q?VJ0dH6B650x+G+KEw8KD5LRi+MYvxCns56JWARx418tNrhn018//Sh0S9IbH?=
 =?us-ascii?Q?wBzm6hldxM0g9R5i62+8tKgAy7oupyno5eTwI1ezptlACrYjokmIh6Y9uAhy?=
 =?us-ascii?Q?9tl8lkJpVKeAddnA5szHvkTW1LKCm+B+vqklenyERQtDaJlBiwRpKkyHG0og?=
 =?us-ascii?Q?/VutJaQiSDJyj1P0cM+X2lAnQKKMn69K51eAv3k52DpVfVXl5+LvruKRItsU?=
 =?us-ascii?Q?mGFa1NovKTB726LV00h29rkDYGJaSigGMD+v4TdgN8aabU4pQkR+D/gaq41C?=
 =?us-ascii?Q?gcCR2H21aFu/iegBl9Bttz8/OtFmPjet8LyDu2mZr0s0bnThqiI88fa6hElA?=
 =?us-ascii?Q?YzpaN34YdICYJBXS0wi+aMBAVp7cg6JGcCsje4EG+E+RaqlsErZ2Xjk1XtXA?=
 =?us-ascii?Q?lbJ4/y3LaLknpiNW3L+m3HwXuQOdzDD7v1fgXfeBNAXETqBlE0zzEtzEaaJO?=
 =?us-ascii?Q?ZXPNPBWw3ihDtQm9LGtfZNvUe1b0vlVHh8sr93bpsODZb/WZ+gVmOkBMbWte?=
 =?us-ascii?Q?mtTQ0hAeeyLGNW7z/OwHo0kGrey6rpqGCpC9iuO3MLkeH8/7ujWPzZR6HLpU?=
 =?us-ascii?Q?n8UfogTjtFPqSK1S+OKJvEQlmjsw01ICMiEJ5jMobxqdlVGA/G5Nycz6etpC?=
 =?us-ascii?Q?N/XqHcER+u9qTD4n2BLFkL74rWRULNM3mLQRIqNfMd/ReoBK67MR4OhjeO/7?=
 =?us-ascii?Q?cF+nXChLqcIplxpTQQ4D/PnD6nubMF6a4Yr3jHqx0zPNCi9M3yPVNRCkHR+x?=
 =?us-ascii?Q?mCR8tjw73LUuAkQ07kALY//n9ON5B5CDIRM8PBUZBnA37c+vhR51bnFHOeVR?=
 =?us-ascii?Q?p+gif4ONzy0/NCBiXdbWg/sEu2gWry531MsfTt8mtz1oPjUe1qB6PBng5yD5?=
 =?us-ascii?Q?tM21LXrAEEe2EFpWEgCJyWOpfvh6JFuFHy0UqU9w+ImRGld3WaY6gLat31g1?=
 =?us-ascii?Q?xVxXPn3TnluXwlr+HkayaQptTLDgNtyeVH2n8adOB0n+4ugYit5ynmD4XrcC?=
 =?us-ascii?Q?ppgtRfHyfrr+Wfys+6zu2t1JJWhHxIvjnTb7Zo+0ddDNYHNNz2qgbQMoYpPI?=
 =?us-ascii?Q?9imUM0WHNesqZnq7dZwp91s4vdwOhyeyntFunq3uof+7LZysdGQ134VVg3u9?=
 =?us-ascii?Q?cAi7ZesAMcvy7wqyQBYcWR8IATAnUJStDXDz2b+RpMb+VSu+IjTZfgKPfPC+?=
 =?us-ascii?Q?idYk9n2Bq/vIo5qZuMKHU5PQm/oAVhoQX9/7XSY7OvKHx5CW/RdAsYr5+wBn?=
 =?us-ascii?Q?Ov0aXYgoLA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02065a8d-7684-4247-3ef9-08de65373e94
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:48.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6BHVclo95CUZgg/W3ZlyrPRNcCy5kS1mqmnqJzB1kNpuG4S3BXcM8wYEWWmTio58ZqiOV4Oen3KBu2j92HkGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 79 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 47 +++++++++++++++++
 2 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 5152c2f1ed26..081b9fce9278 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -46,7 +46,6 @@ impl Falcon<Fsp> {
     /// Writes `data` to FSP external memory at byte `offset` using Falcon PIO.
     ///
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
         if offset % 4 != 0 || data.len() % 4 != 0 {
@@ -70,7 +69,6 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
     /// Reads FSP external memory at byte `offset` into `data` using Falcon PIO.
     ///
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         // TODO: replace with `is_multiple_of` once the MSRV is >= 1.82.
         if offset % 4 != 0 || data.len() % 4 != 0 {
@@ -88,4 +86,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular - pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    #[expect(unused)]
+    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
+        let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size
+        tail.saturating_sub(head) + 4
+    }
+
+    /// Send message to FSP.
+    ///
+    /// Writes a message to FSP EMEM and updates queue pointers to notify FSP.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `packet` - Message data (must be 4-byte aligned in length)
+    ///
+    /// # Returns
+    /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
+    #[expect(unused)]
+    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Write message to EMEM at offset 0 (validates 4-byte alignment)
+        self.write_emem(bar, 0, packet)?;
+
+        // Update queue pointers - TAIL points at last DWORD written
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        regs::NV_PFSP_QUEUE_TAIL::default()
+            .set_address(tail_offset)
+            .write(bar);
+        regs::NV_PFSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+
+        Ok(())
+    }
+
+    /// Receive message from FSP.
+    ///
+    /// Reads a message from FSP EMEM and resets queue pointers.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `buffer` - Buffer to receive message data
+    /// * `size` - Size of message to read in bytes (from `poll_msgq`)
+    ///
+    /// # Returns
+    /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
+    #[expect(unused)]
+    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
+        if size == 0 || size > buffer.len() {
+            return Err(EINVAL);
+        }
+
+        // Read response from EMEM at offset 0 (validates 4-byte alignment)
+        self.read_emem(bar, 0, &mut buffer[..size])?;
+
+        // Reset message queue pointers after reading
+        regs::NV_PFSP_MSGQ_TAIL::default().set_address(0).write(bar);
+        regs::NV_PFSP_MSGQ_HEAD::default().set_address(0).write(bar);
+
+        Ok(size)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 30a5a49edeab..861dbde5a0ac 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -441,6 +441,53 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     31:0    data as u32;        // EMEM data register
 });
 
+// FSP (Firmware System Processor) queue registers for Hopper/Blackwell Chain of Trust
+// These registers manage falcon EMEM communication queues
+register!(NV_PFSP_QUEUE_HEAD @ 0x008f2c00 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_QUEUE_TAIL @ 0x008f2c04 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_HEAD @ 0x008f2c80 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_TAIL @ 0x008f2c84 {
+    31:0    address as u32;
+});
+
+// PTHERM registers
+
+// FSP secure boot completion status register used by FSP to signal boot completion.
+// This is the NV_THERM_I2CS_SCRATCH register.
+// Different architectures use different addresses:
+// - Hopper (GH100): 0x000200bc
+// - Blackwell (GB202): 0x00ad00bc
+pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize> {
+    match arch {
+        Architecture::Hopper => Ok(0x000200bc),
+        Architecture::Blackwell => Ok(0x00ad00bc),
+        _ => Err(kernel::error::code::ENOTSUPP),
+    }
+}
+
+/// FSP writes this value to indicate successful boot completion.
+#[expect(unused)]
+pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
+
+// Helper function to read FSP boot completion status from the correct register
+#[expect(unused)]
+pub(crate) fn read_fsp_boot_complete_status(
+    bar: &crate::driver::Bar0,
+    arch: Architecture,
+) -> Result<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch)?;
+    Ok(bar.read32(addr))
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

