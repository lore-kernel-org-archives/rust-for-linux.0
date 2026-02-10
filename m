Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDECA32BF2E;
	Tue, 10 Feb 2026 02:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691606; cv=fail; b=m1vNUVCScreegd7tgSEX/5np9rl75ZCOgX9n+q4anDceFoCMMM62pkXlSlCuJtTYQ1UliWL5rBrfp5Ul30TmNLUvxCQUzLwMwvInvKCH8Ep5McHrXszdgGa78vxyiAMgyBOPeVfQdmadkzg+hEHUdOMa1AYoCiaO39nSz+kf32M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691606; c=relaxed/simple;
	bh=z04Lu2bTiBi/FKwPm0kfCyRY5PkylnDlQTh/JMSulxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KQoP2s2XfwG40r4W83wS+3QDFRadfgNsqFuupzZkr5gBFfxIWn7V5L5xMXygAWuz1wd3e+2QHeLq6fxhMF629F6zBI+FKzI/1tYsnuC1LEXfBYGdfI/jOpcIaJeyRCFjD7y7IIYM00uDA3i6fPj/5tyU4DU4cmmI1mC2oXf+wwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qIGgIs+7; arc=fail smtp.client-ip=52.101.48.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qIGgIs+7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNVvkkAMS2gnzLNkLgi6sqp4RDez8B/nYtZaWLhUyRSfGr70c7h2SXDMTwFPOUC2XeMfoL41CBi6uof8BdUw/PmeNhs8mObocGUHSrJDxgWuZqdYezRzhcZiA0/IU+unoRGSklebWpvWpspYl96mLs3G28SrAhsoUcksXScou5Ewda50jPdFByoIt5F/D1QOwT5equQzlXSxKCfVIMzb3NXsJGlidT//El4uZRdDtuIxCVZhpBPJsFkaRT2z358bUIaXVyQZWuHAZT917r45W7GR8t8/LUfsb8DFbRSCv4DK6IWUFFwuxZ4/LzxrtUYwzyARAlO4D08Wz6g7XPfcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDMPMe5b6qEvBU4UC1a36uCSjoaNz1h9i4SnmWi9C9c=;
 b=pLjteu0p6Hq0adVqT+H0BNwAo0fy+/gYS1gw+biMjjEYvW74lJkB9hF0hn8eiJy6f4hdIsQYMb5sGoEtzhFtnAI6cc+kG0pTghE18uUHmv6t0HZbEp9cqLn3x3RC2vo8xNESoO8/CVeHk8XyiVwjPqp5TOX7+4Gz1AW2IW2gj0l8+BdvJzenjD8FT0hfJnVGC3SIbyk4U8Vbf17zXdZOxZ5izqooDwRwVOg85PgiwWlRs62G71n0C17NmWfy1vM99YCP6NsmxaAxGKa+2/ovu3BcSF9LPlBDJWGvX5d9cO+JxT8MRsb5ED+TRlPasFRXaW72R7i60vdtbDAbzTw42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDMPMe5b6qEvBU4UC1a36uCSjoaNz1h9i4SnmWi9C9c=;
 b=qIGgIs+7fP+c5He2GeH+jS+BFx2Pi5/lJGAftYzNb9eukyjhR9T1CjM9RK1u0q/VMevxbAJJUOtq54nqdH9QQ5ooXl30mQQ89v6MGZAuuCWgop6qha558dS4iNaVpQsWmv0FqZIcko5CdrVWrauLVbwB0jPM6jww3fXiIkT14DYPcQ/lIHOwxILkyi1wQPS1K+8gh/Kmvab/LT62jNk+a8xzHnmgFzWX5liQJvcEm6C1pQc34LR6LWeA59v0JHnn7+rCJDaVQ3EX+ZmhezK5Yfpx6Xziihyr/jpXy8cP3lm+K3uDKDIwtZ9M4V/JM71+ZwPieITC6Uyk/741F+a3iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:31 +0000
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
Subject: [PATCH v4 23/33] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Mon,  9 Feb 2026 18:45:50 -0800
Message-ID: <20260210024601.593248-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b10b93f-482a-416c-c3f0-08de684e98f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7AYXm9MXNeKsn0Ofn+C/lwFwxnftz7WyYn7I+qVl6tZl3yA3QJ4qD5Q1r00/?=
 =?us-ascii?Q?0fsm+jgnVp6Ur4jJN7A+wtfLgySvlueeuQOFN9KW5UhSvczUUAMo2pmNecYZ?=
 =?us-ascii?Q?OH0F3phhhtzZ2Dw4BKpM+H/gzEfk8htpiXnMa+kSAP3dWwEMCiUamksXeP1I?=
 =?us-ascii?Q?JYZYhBJALnKdVcYUTim3NzrZQ6tQC1jj2THhEUxil1kEGlMsDWtIFih1HNtz?=
 =?us-ascii?Q?popTjwWmIOgcGni3zUAicBpe2icLD9b4WKN6y1k+YshD1V4NNZ9FuP1ID55Z?=
 =?us-ascii?Q?XKy+292CD2miDYYJuR2r9Ulf5FvONaV5wque2c90I3CValAgasS2aQbCRH2W?=
 =?us-ascii?Q?lRD+B7OnrLnLF8S6kfKGky6ejZaB9u+WwcCcEnF/yhywJVkgxj7iH5MMArI2?=
 =?us-ascii?Q?8usNaEsrGBBxsFO6MyT0fs3njGZxO7iCDqAXxLkb+kzjVPb+Hhpbdp+qzfqY?=
 =?us-ascii?Q?0N1Y5LHJn2RPspXRjRbqyq3HT1bHLNNPVJkZ4lyuUPvfAseYoYwMEQR0DHEs?=
 =?us-ascii?Q?BCCAXsWLZ1Ps2g5eGYkdDU2OJWyCRY7bo7DSkp/Fu8bbybb8In9257X5vNGG?=
 =?us-ascii?Q?Uljvbvcg/FNswgwiH+QV3f/+oyebM3jKSzfaWKY3YF0yuJSGEsTwc6KGNamd?=
 =?us-ascii?Q?mKUyGsF724Cm7JPmwXBVZ6/1FkFG9Gv8q+AW5Hn0p44B/i+P2gUX2yFbuh/4?=
 =?us-ascii?Q?jMiq4QWiZp9G6epTOnbepN5lfSODZa3yml/stKY/i5cCSCFiagH45RiX78kV?=
 =?us-ascii?Q?qtV3ECUUxLqEabjityu2j6aj1fL2zOalEmBhhjNLfLd8WqU51NRqzwZHfx1O?=
 =?us-ascii?Q?j+goPjUD+ioZlcYi1y2X5GTPiHTDVXaNejFA3OWriFoXTMyt74x+RAeInpiM?=
 =?us-ascii?Q?+mK1/ndZDL8P3krRbLFz7xWv0Q3XMHoZESEGhj+8xGhP22qWmwscjiSO12vW?=
 =?us-ascii?Q?6HnF25EWPRGzTvxL6wxZrus/9L3WLMnYFEH5kNRABxxzWYBFS354ug3pCBWl?=
 =?us-ascii?Q?RBBo4HC8744Rovu4Lxcg3dT2jwqrwV+9yfVZyFHZUgLyCPs02Aiq5u09rHEM?=
 =?us-ascii?Q?tuwOMisYZlqBfP9/yrVt1hmYddsT2i77gW8hyph2wuhO2txqpucsGywjkuWI?=
 =?us-ascii?Q?OevAv6u0+sg5TGhwWoZ0Hjxk9wa1Tyghfz9P+J3jOE1BZ+naNBy6+4tyoY/9?=
 =?us-ascii?Q?uSofFyrIFb/dZaEUHq6AXQvXqNvdrOj5q88U4RAgNDDen2pqbAHHr8cB6czF?=
 =?us-ascii?Q?U4pMCOO+VqivBg4FdUvrVHXavwbVMU7YqvQz5L4XQ9J1TlnP9e2/fT1n2Q4p?=
 =?us-ascii?Q?WutTCq3r3VWp06D/OXAzBmXPsZVS/gIc7tuHGRxxrGo7bEWqPAPvZ2F12BYt?=
 =?us-ascii?Q?AnyA2G8sojW+wNP2eAiatPbw7sHhilzztjCpVSfC/krGFUmU2KexeIjCSOhe?=
 =?us-ascii?Q?MB3l00bo1p3iyTl75YEv80OyHd8J78Y08c2ZXW6FqvUdHalOWShosE/uDT38?=
 =?us-ascii?Q?RTU/GVHOfpBRHCZ7EtjDExncOb145U8Ye35KkvT8NBkK/M5PNUpedOB4/iJM?=
 =?us-ascii?Q?tOlhuNksA33gIuuiuyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0rTriTCuBcVncg8N9pwJszK+yWLMDMVk+DJ5HHWa7L99pOqIKRkosABW9qSg?=
 =?us-ascii?Q?fGcgukLNThCc36mpevphfzkVe3361T4mu+JgxJ0ZpApopn8oNwaE7o9UyXU+?=
 =?us-ascii?Q?vfZSkcfBL1LcQTA/GxqT7YcuueAh6zqPAMf9AIIlVNIOG0optszaTYvZ2uQg?=
 =?us-ascii?Q?Q6X6ZZEvfjdggowkgA/5Fz7UWGl+8I4ab8FLKGkKq6Nsk/tQK6sSsmRruxsb?=
 =?us-ascii?Q?EPyh/BMJi81EApQWDWW7RnEGOpzlgjh7Nu0mPKE0ESqg0FuAzkTaIlOGOkTy?=
 =?us-ascii?Q?CgQVmmEo3bJpuoHpPpbjqnghHYPpNR5HzP/FcA3i/uiQC/JtJeDIgWZ2zJ29?=
 =?us-ascii?Q?6GxyfI0gfHAAU792IpH3MAISfFgAE5lq7FCqAZny1MesIqRzYm42rfbBr2hu?=
 =?us-ascii?Q?Unwwnn1V0ekxlKHda6HcxJTfZ70Fv3B8w2Rx+gyVlwsuaEsShBCgAtVUbeeL?=
 =?us-ascii?Q?4BZ7xu4DDH3pNPzjcJ1H3OJpIJXMNVrFTLauE49D4z2AULzH3xu0us4TGzHM?=
 =?us-ascii?Q?a5f2O3j2w+ndGQnT5uHspvFnqXIhMVvDl1avQZxLXaBoYLgjZV5zJvHbkyJK?=
 =?us-ascii?Q?H1rc6zY5jtAKxO/jp1cDsinZGKsMM+ouXfEpD+tcz6fjcKOZcd6XkuwSzBnz?=
 =?us-ascii?Q?P13YXXJrOUxkzI7K+mjRFZ/LEkfr8hlWd39NwGb1a655z9T4ewYz0li0LDma?=
 =?us-ascii?Q?dDj6VN2fINtEhhd29y3MITiJDAqiVe73+sLBb0M65JKeHRcCiGz2/noMAohD?=
 =?us-ascii?Q?VsPRGCkuL0ekZ2VL2WAO6LSuGu2AE6/SuNeZh/pkcpidMdTccu1Qs30rWzqF?=
 =?us-ascii?Q?UOCjSxskEO8Pz/Vq2X1KxV5iQQhT6C1RFKcEPOPAqs21U5yw+FA+cGB0tuNK?=
 =?us-ascii?Q?PyukonhQ8hO0LzpkO0hmXKmNZT96zUvxE9gDUVBJ2aN9kvUuKFQpurcDTjNZ?=
 =?us-ascii?Q?XGQneV2gGyl4rscgFn++cGXTX9/xeG0TdMpLbPrN7W2d8ozBSlI++12WrB0W?=
 =?us-ascii?Q?7bgi74eymb2ZLPwn4E7Qo34oATyiZouNSbFXGbCrVlvP9NkM323JGP6pR0I8?=
 =?us-ascii?Q?+zTdtw9kxY8PS5CMO8nlk7Az4leU2FIKfCv4geMyklUbfwbsfs1qKUuK33/d?=
 =?us-ascii?Q?zbQwItTsf4Ogz3HdJAZ7bR+Mytxn7f0qe76h5smJdWhoxW8fxI3HrCBoM1Hw?=
 =?us-ascii?Q?NsGCn6RnN6keE2yxCx0MirNoAjjpAH0Q4LUF6LiPNe3Qrr3Jlk6HKZLS+55l?=
 =?us-ascii?Q?x6f0H4HkTTSnx5enPE+2jYqfqXtJQjsjBebmMH/ZPFHqvoNcW0W8tJQAvpes?=
 =?us-ascii?Q?2ET8LjR012QmkQYrRpdkglygQo9pFH4iNVi3hg7GZ01DIo3SvEKK/M6mtqGa?=
 =?us-ascii?Q?IwRVr5C2Yp30Qp+UjmuyFG/tPTA7E3c20915Z0YPLPuxYG+HCLoJovq/N7Wj?=
 =?us-ascii?Q?pqDkhgTG8XOyN78Eg94bSQTF0c5v2dQshxEWo4KXFsHwHpTkCPzo2tCIOpT6?=
 =?us-ascii?Q?2eWMNMFRj3zozLdroXcYUsWR7Av68JfYM+Jq7LnNTxZ6kSN/rx47Ao63Jbca?=
 =?us-ascii?Q?PbV58hzLuVocq5sDr5ZKAUMa/FKeAEMlDEU4H5lCoFUq7CEyr1z5ybsk9BMd?=
 =?us-ascii?Q?+LQYV847tHbbAd5EdQVjRKxymuwnpUtniTcSMrS/l+smzkFIJy+UFXUQ+L3B?=
 =?us-ascii?Q?z7m8sDfPNq+PNgNgDreXc+o4LgDPQqlT23RdfQkoz+OGQbBjEAtkQIMcA1WU?=
 =?us-ascii?Q?EU79cvYqlw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b10b93f-482a-416c-c3f0-08de684e98f5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:31.7842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQl99h+AhgofAfH2WUrNNWvs/wh0rEglEp8I+CiVbH3Xni7ix0qIK5mOU+kMMlK8vDfXosEgSg0c9mI3A1YVXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add send_sync_fsp() which sends an MCTP/NVDM message to FSP and waits
for the response. This handles the low-level protocol details including
header validation, error checking, and timeout handling.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs |   3 -
 drivers/gpu/nova-core/fsp.rs        | 101 ++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 51dae900267f..08b382a32cc0 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -90,7 +90,6 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
     ///
     /// The FSP message queue is not circular - pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(unused)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
         let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
@@ -113,7 +112,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     ///
     /// # Returns
     /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
-    #[expect(unused)]
     pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -145,7 +143,6 @@ pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// # Returns
     /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
-    #[expect(unused)]
     pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index fca03e25134d..479b97eed7bd 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -22,6 +22,9 @@
 
 use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
 
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
 
@@ -311,4 +314,102 @@ pub(crate) fn extract_fmc_signatures_static(
 
         Ok(signatures)
     }
+
+    /// Send message to FSP and wait for response.
+    fn send_sync_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        nvdm_type: u32,
+        packet: &[u8],
+    ) -> Result<()> {
+        // Send message
+        fsp_falcon.send_msg(bar, packet)?;
+
+        // Wait for response
+        let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
+        let packet_size = read_poll_timeout(
+            || Ok(fsp_falcon.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::ZERO,
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP response timeout\n");
+            ETIMEDOUT
+        })?;
+
+        // Receive response
+        let packet_size = packet_size as usize;
+        let mut response_buf = KVec::<u8>::new();
+        response_buf.resize(packet_size, 0, GFP_KERNEL)?;
+        fsp_falcon.recv_msg(bar, &mut response_buf, packet_size)?;
+
+        // Parse response
+        if response_buf.len() < core::mem::size_of::<FspResponse>() {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            return Err(EIO);
+        }
+
+        let response = FspResponse::from_bytes(&response_buf[..]).ok_or(EIO)?;
+
+        // Copy packed struct fields to avoid alignment issues
+        let mctp_header = response.mctp_header;
+        let nvdm_header = response.nvdm_header;
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        // Validate MCTP header
+        let mctp_som = (mctp_header >> 31) & 1;
+        let mctp_eom = (mctp_header >> 30) & 1;
+        if mctp_som != 1 || mctp_eom != 1 {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:#x}\n",
+                mctp_header
+            );
+            return Err(EIO);
+        }
+
+        // Validate NVDM header
+        let nvdm_msg_type = nvdm_header & 0x7f;
+        let nvdm_vendor_id = (nvdm_header >> 8) & 0xffff;
+        let nvdm_type_resp = (nvdm_header >> 24) & 0xff;
+
+        if nvdm_msg_type != mctp::MSG_TYPE_VENDOR_PCI
+            || nvdm_vendor_id != mctp::VENDOR_ID_NV
+            || nvdm_type_resp != mctp::NVDM_TYPE_FSP_RESPONSE
+        {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:#x}\n",
+                nvdm_header
+            );
+            return Err(EIO);
+        }
+
+        // Check command type matches
+        if command_nvdm_type != nvdm_type {
+            dev_err!(
+                dev,
+                "Expected NVDM type {:#x} in reply, got {:#x}\n",
+                nvdm_type,
+                command_nvdm_type
+            );
+            return Err(EIO);
+        }
+
+        // Check for errors
+        if error_code != 0 {
+            dev_err!(
+                dev,
+                "NVDM command {:#x} failed with error {:#x}\n",
+                nvdm_type,
+                error_code
+            );
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
 }
-- 
2.53.0

