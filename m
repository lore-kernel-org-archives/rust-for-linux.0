Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C93F32936B;
	Sat, 21 Feb 2026 02:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639868; cv=fail; b=RDhG58B2eS3vignFSDfL8FEuavZd47GahQlX3H/wYlsskPE2PLgmasBqke9d0+6mCDPMSJz3iItaG8XXJ4M899zVQGRgwzCN7w2LuVAlk0Hz8ks/9/xnjKfYVMX905TpOsukjzE2SVSqbVx26XSb530kOR5ObeFLCOC/ZQP5KPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639868; c=relaxed/simple;
	bh=hyEbLYHGBN8dg3/lEn7diwuIz37+mBe0F5UBoXsNu6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oR/YRFGQCkSwgRLHEUQ8q+24hwmlSBm2HEloS2urzoN8nXzPDrgoUGnmvinC72JlBBfm0KNnSBTmyagYZIlE0mITSLQudp9R7EFcRIOGHIiKh3th59ypV4ivrM1DI1CR9B9Xg/d/Nin+WeZepZcMpgaEjDMKNbS1CsOvWP5o0WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tXiO0Xa/; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tXiO0Xa/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1nmgjzAW3x+K8aWUInQ6r5R1P1yrS7orEHkyyTnthn8i/j2HPd+avpS/U2zEH3sXEzvYs8MLwHULEzH6dU2svHiLLBEp1TO3gAnhoKYAvoAKww0YOeJD/gYIqKitew/ZjzLhATsLLGGxUtHKgUi/JGpgwrxt+Q6rKFZQF6tNmY1EejOfB32T9Sa3qXFr6K/RqG65k7wIg/4xrAqiYlXYkaIY4GaasJZe4B1zVkr5Yg1wTRQkiJsPRF1DJTjglTbk/yk/oMTUUFTTT6ezz4/rMWd7+r9eMWOT+iRfQN9ijPaBeyZ5xmHTux8JywVwfAJ7xptMGQqZWR9P0HbWguEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0pfqZ/Zsc+2WbDodFECnYA1OtwLOwudUh1xZlV1Hio=;
 b=jjB7DeMBPqRdhJjofxAwXgLq7JUYX4Z4I3e5JfAWw8xAATTnVuV5nBuWwLbyfJUAOzzgu5Gh6hjauysoXrXLB0QTQncD/jjdcrJpYQ8s9IPef2BiNZc1EkITWtM+9mRCc8cPtat9wwZ9GwaC6Vo5wU+FuNOXFe504q1upYd5NreP9Rn3TOZ36SKQd6gOPW6Vsz+8VPm17YqJwviupi7FDM2ETbRK5fdkaM2JExR/XdBtA2MNvyLvau6rkfnYePBMLPYnyhF0UscXRQ7U2GMBT1WncJJjjei1cEto5a15DKTCxl9/YM/ECesoK6D9OXkrmB3c2rEmDMAJrAtgkY3AIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0pfqZ/Zsc+2WbDodFECnYA1OtwLOwudUh1xZlV1Hio=;
 b=tXiO0Xa/wGyLWgyVGcMX2IcdZE2CQKQ6Kusp2K/t0s/kZtkYrtRLLloAMzocnO90ziLXWlgyZSeujQpSCtWNCJy6Tr4RmZamc2vOWESCK7sBIqrRakVq81JZf0e36DkLxJzfwR5kILgbDDeBKieRuCHzDMhSMpvHuS9ibX3xhSyG0hd6D013nAnHDW4TN/MGJsn15iI5sAgSqI9nhjPZxM4tEDutNGAGlHyYPcR8rYBdouOsnnEywQk/W6jw0oVnJBZt8jSSgQmiC0ft/bJkCzESaI1sSqhWpA0mXRJOYI7tWUuEBj2c4HeXlMPFCA39KyLhLfAfAam7d4v/yuE1Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:19 +0000
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
Subject: [PATCH v5 20/38] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Fri, 20 Feb 2026 18:09:34 -0800
Message-ID: <20260221020952.412352-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: d05db52f-e3a9-4089-3b7f-08de70ee5c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1l2M/vucG5rZCYzOvtG4c2AnEpxlQ93n+mtjkYVlMaIOPkAeQzH5aCqZdDPS?=
 =?us-ascii?Q?1419VtWGZ3GNr/LPKRWZoVc5pocKhlznJWIE1SIWduWLoyzhCpY+sEsbM2qQ?=
 =?us-ascii?Q?3TnmnUX/ZqjNsxNEGQY6hVWIv4LppovOqpJwm1vZBrESI7J5Uch7Jl2exulV?=
 =?us-ascii?Q?E8oqtNSncaZU5dD4NyHXj2JulqA1L+eRHNUG1TJlFs49LOgnuSsxsgb2KRSq?=
 =?us-ascii?Q?wYQfufeaJha4bXlWz9qBuNz68MM/VofdDkfNHNKBn12jQa+uOPbCpRiLVIiM?=
 =?us-ascii?Q?OmqO5yrXiJrvjAYH0heU/U+YGtqag54yf0oA7JUTKpowTFfwx4KpUF6SQBtf?=
 =?us-ascii?Q?vi713F76A8vysDY/kybnhyJipimOW8XSaUOT61TV8oId/hAAeRfWHtljfZY1?=
 =?us-ascii?Q?/UNqvlX0Wv7pCRWY5PC5nwprs6fX3CicYPZqlJLXa6e3P+uBdnrkyfYXSYuw?=
 =?us-ascii?Q?uqOl/rl+Y53kFl1sPeYJWDndEyPjhuaN6obzOCzUXv9VRsuWMSmT7FhvYM7Z?=
 =?us-ascii?Q?EIpLeoqWUv+hPSEsRFZOpawl4h8vah7aM5Hvd8YZ7IwmiEa4s1RTWUxmY2FA?=
 =?us-ascii?Q?kpiCw0DH/Fv0tIFoTa0LNhBD47vDdThyLh3bF/1NsN6qGDSN9LRqlDd6D7ui?=
 =?us-ascii?Q?zyArGxwVVuXD3QDaOFbPN071tbskZLMiDTZM0L1pV12IHnq71owJLuGOB5lc?=
 =?us-ascii?Q?bLI/JKo5lEkxuoI38yx9O5TYlvssvToYkjhmUU/Yc2TRX025hJtbnKhJt9aQ?=
 =?us-ascii?Q?QzOTXblBeGVB2jV8+WM0UUAsxTTJAAbK5FR+sNP8CxoY/vFDruCgfxqOCp+6?=
 =?us-ascii?Q?zRsKN6BPstNlFoSqtw+P5jSx6klD7GhiQZJNLhqm50CdgbBQUke4GT6tRi8S?=
 =?us-ascii?Q?DrcKCrtennX2q18wsgBMFiW7C1OK4xPQIJwkIkCUF6uVAH1u7SlKlCEeGW6X?=
 =?us-ascii?Q?3azAm8Rd4vkUQuFJ+bRbdrSAChPlky/RKLbRVI06K6ymEGoqfJdKCK9uuQxe?=
 =?us-ascii?Q?Jcln3DMreXSu9NjyJ/vcDHyY6AywIU38W3f6Zj9iaeBsQtOwkIH1p/1ao4Tq?=
 =?us-ascii?Q?VtjH3Hikv9AAAg/zmqG8myWms7A4Ar/VbLQPVGhJgYPxZu3k8fNubLPo2VwW?=
 =?us-ascii?Q?eeYi9CPMOvOj6QvaINVOkBEUZLN86RXhkfQPRZfNm9v8RqnZFcNntsVW5BP6?=
 =?us-ascii?Q?JKo7iF9nfne5blLT8C/Gsyy6zJL/VLwUyszACvUEXn3WxdDif7680e0Edezn?=
 =?us-ascii?Q?fjxpwt/ux/9JvUqPWHfFZagFQ/VY1LPRD/q5ol8aXf4YbnBWDTTD3rGlPEqP?=
 =?us-ascii?Q?bK7ak3+SROvzS9zjT1QDHDUUl+zZj0KltY3OOIql6nC0i4wnhDD622AoiAaz?=
 =?us-ascii?Q?vp1qaXZG9qiAVGBRuSkA4eF1Q8ldSER+wFb1l56vPgjT4iQlFrMqZ85oklaZ?=
 =?us-ascii?Q?tx1LTCsX2rzdQV9rH8kKn8NOyD8ra6NHWSseoe+EgzGqzOHULh9bVkht3Kgd?=
 =?us-ascii?Q?3xtA98oX/4FTSoeCGIT16D5p4iIfDSAmF9dR6eZvx+8AmKSS3ZjkGqobklE6?=
 =?us-ascii?Q?VKPMfEBYrqgm5SDeHeI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eO5d7CEBUhVMhFPrQQukiq3dRd83qy9/OOSsUM1HC6i46ki5kktMqoU6srYM?=
 =?us-ascii?Q?N/w/eBD7ni4k8wsVyc6Kp69lep1hS3Cy3/pggTjAbVZte7MtjTPrYxncniru?=
 =?us-ascii?Q?c0ZnUVJVyneFAjTiUhQg9Rh1Htxl8+EyWtDoCh5UeF0Cn93WOufAINFI5mzq?=
 =?us-ascii?Q?E4Y6Ch+ilFP+OpgWhgi7HbVqNxe//jm+YmIainB6PEh1y4t/l7ZqU81BlnRS?=
 =?us-ascii?Q?Cqixieqif7tSx9CmNjO9BdhkI3bsQ+mELotNnyTEIuBPGTpctfLlDC7oMN+e?=
 =?us-ascii?Q?/aOAWGu8NQ0qxf8NGANl/Ap95CeElkmIJ0hi8++bZ/wHBAcahEjCFeE8aQ1I?=
 =?us-ascii?Q?o9b/7mYtZ6h6uBmNJroySqPhJbr/bO5qZ1MRaTuC239TJi59AbXCOrvFspQZ?=
 =?us-ascii?Q?nBSHnmIDL+fQTMVXEmhrTpJGj4uQV/fBe2CYSkgVtPNKoDQQRbairDpcWmA5?=
 =?us-ascii?Q?jHwX5JYD0ZjMJJdf29GOywLhPtCJKXwTBPMhuGCsqQkD25je8lBpBmt3lNCU?=
 =?us-ascii?Q?vXd7/boDs36EyBCuo5A8HBBL51HXh4Q0OShjRozCOe2mUHwKdw4WzV+vSoIy?=
 =?us-ascii?Q?8q+FxsYrg+YXSOdgtWko8mb1kczVl3zX2GFkBlih6ph0LYtvwEDqUq0+sX54?=
 =?us-ascii?Q?Y3ayWbK2Ue5U8wjJZlSLH2UL+6C4/EylGNhhTJGRrL3xWAleaZRtw282figq?=
 =?us-ascii?Q?5kPFUMSCQotxYUNUlspch7dtMFcfQrDLFhVj+/E3aAiddukhkOnmb3+fGwY6?=
 =?us-ascii?Q?pkudm7WKUM5y8RYG19Vo5iGNPQIZSzL/jbDiMxIM8pcAE3Am5FEbpHbrOYuy?=
 =?us-ascii?Q?wzXV6fdwVErcXCYRcC6csbHbKlGkjjtDJ4LoIACSxl2l2eSt0lrD7fUzL57o?=
 =?us-ascii?Q?y3RfcM0jKdovPgsSD7WWyhWJwcmJJwMTUzjiNot6xzXgze1i4yrHLuLQ2hnm?=
 =?us-ascii?Q?1XuO4/sLM8pbPnchPqfDsCQQ7U6kNPVaFkZ6anvH/XeUBYcMc7V7chPreRIz?=
 =?us-ascii?Q?+ranb8ygEcrMtrFUCj9D3jL1mOVBKGeMySh4mrsMdERR/QAsN9cWnEWb/g1l?=
 =?us-ascii?Q?27pMiglY0dxd/13tgxD4EiC5EROy0xFLJKCiEHM88rUT24XBUk2DeN4+3Me0?=
 =?us-ascii?Q?77pPruPduQrsL4tdX2FvraxjyY5Q37kWkPBAt1IuXJGlnPPsnGE9K/AmpPrq?=
 =?us-ascii?Q?JqsWV2dcgbTg0/A+pQMNfspMCZkiE4dGzyQGPvalOXLK0MG97akroLq2Y1cp?=
 =?us-ascii?Q?vFOuc2bSvdJ9uTMdNwnd1yz7Yf9dvfQIyZJkt8vnYzWiTeQUOh70WnzVw8iC?=
 =?us-ascii?Q?6ZnjxTZJJjpRqkEhGueCVO5WcRxATFBrLGBzfaGhh5Rvp/W5W/aENU7O/71N?=
 =?us-ascii?Q?eDCD2bYM6pcAF2GKGjswvaamEcbd/xN7+wm2DY/nkebvcORTf1nZoE8fmkOa?=
 =?us-ascii?Q?Bwm+ybzHk3MLhEkmV7HnE4irpy3NxW63N9p4jjKsaG5vF3+EakfP0naqFLq2?=
 =?us-ascii?Q?e2+SbLYCcbLOHdwOqlFoZY/9k/5SpjC/wLd3MYH099Xu7cZVCSM1hv6zGi1a?=
 =?us-ascii?Q?PP7T6JlLyF0xQ8q+3j/D8dfbKvXwf0cFiPR9H6gWC8kvGEjRHNa2at/XhYZZ?=
 =?us-ascii?Q?Pz38ks3Q0+XB1AnrwGj+obPgowZG3xH6NdxdYqOenOSujhA5S/yXBQI7fnmt?=
 =?us-ascii?Q?yGnCCoxeoTFqf/Wv6zwQuwvriWC3bjq7I0fWU/pw0KOVL7zPRCFI0BA62uHz?=
 =?us-ascii?Q?R2Y2nogV5w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05db52f-e3a9-4089-3b7f-08de70ee5c49
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:18.7318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g16FdAbDIg75UXZXCFK2UDV16/DTy72NiUM387bSC2pmtlq7+q++8ZGYqSwrgGfvEjbA6r9cEuYl85Y5ZG17AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 79 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 48 ++++++++++++++++++
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 4baeee68197b..d68a75a121f0 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -110,7 +110,6 @@ pub(crate) fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
     ///
     /// Data is interpreted as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -131,7 +130,6 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
     ///
     /// Data is stored as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -147,4 +145,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
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
index b939ec2d5bec..35639ea32e55 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -8,6 +8,7 @@
 pub(crate) mod macros;
 
 use kernel::{
+    io::Io,
     prelude::*,
     time, //
 };
@@ -443,6 +444,53 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
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

