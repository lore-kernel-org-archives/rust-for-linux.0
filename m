Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA63376B8;
	Sat, 31 Jan 2026 00:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821007; cv=fail; b=qkNYK+Ze4dPnVFACuXYl06qLOJt2qVO4UyA82xFEuSWa/itnkMbcIHmFHeC4WXld/gw/qh4dTa8B23bUmKu8J6iYU+fJ0Fqo69KWLBpogH8TztP0FfA3tDeOzhMO5RYu9b8cWNkVjHgsSU9HCn8MZhnvisT0sSRWhMP6TWUipLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821007; c=relaxed/simple;
	bh=Clo7YIqhowMa4bV+caZrxb8PuEakNiKdYQgAXCdiOQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dJ+ZRAugctkIPAuvDyJmizhys5K/6MvNOPpFPfAy3ufBnK/ESobjP3MQZHShrqQtd6bZkbgPeMyv73lKkydWH+lQKYnn79F8f/RW7IEmfgjHpCC1RbC0PvfvK3tlhx9YdK8VSLACtSAaQk5uRqWczr7oBdFapAcbzm2Go6CY1GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I+Ehq/j6; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I+Ehq/j6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmCTzFPNWkn5EYq03qFhNf4ZOpEui8D/gwHRbXrLjICXVEhAmFx46imRcECKgJeNr+EUnRZoR6BW271jRm0CaL9DtKFPrhoCRzegVJL4A4G+Wdi2dqQ9KFxruZuIa68kZcVYvmd2tMLW+yEiun6AF8fRVb+mlkRFUxybApekspNnfpC08kotqVSNgbyhLzGggusddFxMJ+VPypFJEUrWlkfHT365q9igvEobME7oMJjORIvW83gvGfrllGaXYX1Z56F1Z5na5Kie1hqBooJCMV4V7YAekiR9xBzh+srd/HPEgY2V4E+mpmagiNaBlOlZJgjaHb1+WrE08wiRlzV0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtsicKQN0I0lv4VG0SJGBafyB5tvLdwyqIErobb8sig=;
 b=koiYtHeuZKSlP/HFP9JlmQiA3jIl/ci5x1Mdjd/rfFGsmyhFFdPkH7DbAEEM1eTYP02z4g1n5NpQlAdkyjFI5OnPt1ufcZf0Aqsb09w3cfT3kDyZMm61vMyjTvcWaY95PXMxp84NjkJarW1PT7zt7UmuC4EAw/qtmh7CGk9zDf+FSUgDjkom6lU6Z0xE6Mrgcu5VAf3nDmgQNHWN64rojYTWrIPD+xnP9BHNIbr4y9M+JqcouTfX/QQEmt7ZV88wtfFugrowHWkxjnVDvSVv/1jAD/Va5hqx09KycqgtFGHuugOir+6vX0+A9V8aC4Rzx3SQCfClL8Qjk+ABhgMtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtsicKQN0I0lv4VG0SJGBafyB5tvLdwyqIErobb8sig=;
 b=I+Ehq/j6jBjELkNOr7u/10KaDkVQ1lEOs1DM4oAcgc216znFdV/uX5vIqA8WnG9s/19pn9Qd4IZCu2D+zgkmSCyqKO/WnoFvoJ7MjamBgn/qYvc6mD1mxc4bG6bBcT7eskdtxspqDVnro6QWi0lACw/u1jgy5Xd0oh+vkACyyQq30g4lZIWTWGSACsBzueOpzi5zQII4K9CIjQnSxqeyx1orZF8T/nGNI7Kz+3AXrdzMo+5qGr49QD729r8YDlgAHQgUErnkw4qqaZGy690so8Y42+vxve2HscMdD6/c6bp6yOTKwwiZFBCtATN3XH1/2IvYSNZ3hrIoNCmDo1+diw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:37 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 22/30] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Fri, 30 Jan 2026 16:55:56 -0800
Message-ID: <20260131005604.454172-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e31266-9dd3-43ed-63f2-08de60639605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wZLthxuXPN7vEMzilcqSjy4Ok9pha/8Xq0qlpyq/0vSmrZ8p8ctaUy4Rs7rE?=
 =?us-ascii?Q?nntSMrNg5kD2fdpd2ZYb+WLvbS7JnMh7Qs350gwfKUKSnKZVExSPpRxSWGFJ?=
 =?us-ascii?Q?5LIl/Z9s0nS00hbZXKoDc4PAR0hq3OYIZcElwRfAsO2ANdl7bxNh2R96NMeV?=
 =?us-ascii?Q?eA6xXNK5I08AEepWKSmQsYsxdgXVgxbHWFXTHl5Ak9hChxRRUuhyj2PRy306?=
 =?us-ascii?Q?jVvewiRv5QPpYovM9z89oiOhJv4/PVRPRSk8ag+mlFeCPEplT3ewdo/hW/5T?=
 =?us-ascii?Q?KzgjAyVmSVllOV+SRQJ0zeUTL4y7nS++3prgoNHV+FJZqjd3l3Ue+Eq8YwsW?=
 =?us-ascii?Q?A65YOISzgp4YQPjiur1D15kYYrzhU5wQ+n7lkcJLXm9ph/YLf4Z8r8ZPniAj?=
 =?us-ascii?Q?mUe13I65hQXM7DKHNig5xnWEUkpsvKSqbu+V2MIkZJvdqi328BE2Dk+qCQ5p?=
 =?us-ascii?Q?rYbjyBTw49YbFp0MnstyGu4A0WKnMzkh2GCwfYdwNcqftExh02SrpbMLESmK?=
 =?us-ascii?Q?VBo1truh2CZCuZXn/bun5o+JFn4yXSSJeN2dpRnGVZqsdu1AWg1yaaf3OU/g?=
 =?us-ascii?Q?hVtILXC1Iinfyoe9srfG1jAbujxIl9yQYmpSFi1Xuz71/5xR+YdfCCEZT2y9?=
 =?us-ascii?Q?2BM0klZF7/+z8M+C/8TvaSVyBQ2QhoE2qIKH+/+f2I1zX5xrFPwro68SNU2W?=
 =?us-ascii?Q?jifDTgchE8GPl6RFf88IkGzN53Tb0IzwX+5DJqjAvjGDVCv593olAqd6C1yR?=
 =?us-ascii?Q?HuT5RNmb2zJD5aXx+a2eWaxy29VgtTpxB6vS/UXQ/g4c55zii8DdT7/rwZ2K?=
 =?us-ascii?Q?6KN8SD8PAItMX8BCKUTCUqN3VFEgNgw9KwvLSxpO4S4DuOUPlyi5nVSyHbsL?=
 =?us-ascii?Q?EEPXbfZfoooHuWXXpzRHGkX5pr+X2P0FlgXdzAH8+FX6mbjdfUox2LTiFImC?=
 =?us-ascii?Q?8dRyoPu90fhDZJ/a5e/XJNCDp34Wv9l41byaIfiqPGOtap6YLg+MqDFw4ucB?=
 =?us-ascii?Q?AdKElXdOZIyESCu1pGFmiVBBsFyFRlI9jq0P4MuIFtK7RpFeAPJxyocPZq9e?=
 =?us-ascii?Q?5kJfYlNomtl0cDOMRO/e6CPyKLq6e0cJlNDvSGfJWs5l20EyYjYy+gxcS01P?=
 =?us-ascii?Q?SRvYdDdPlFWtxyMQjYdfgYHtP9FexHuCVpWWychAotsBdjkXMYrUxXWrExfB?=
 =?us-ascii?Q?T2gPMXne8QOV0piQ/l/o+DUNzIgyinPsPNDJAYvxryb+wvdLq1RlA4+JyWVM?=
 =?us-ascii?Q?zSOD0c4nadZrvoBAbPpxfdIrkhgiC4NJDGSu6lXzlPg3cHW4YOJg6Z533/35?=
 =?us-ascii?Q?oRyJitD5UhGk8YsDEY77KF/6zGKYoWTkNd3LceQSk28ECWBpb8Clx9qBGVIC?=
 =?us-ascii?Q?1XTMaPDk6FbnKZ/Xfc1Xh5WvJcbCSLRLf8GHHoPMo2BC+z/9SJA7Luhfp/VH?=
 =?us-ascii?Q?+KLvhtKpqR6JDYsXsAPbKfZNgQBhpOVi7ylO98Z7jX+i6BUCE7272LIAiqda?=
 =?us-ascii?Q?uxJtnyReiy5K61rUkK8KPzVgjYauDBEgghgKvc+hV7pqu1p/9Hr3I//Xxj14?=
 =?us-ascii?Q?zqav1psSWHs+ehO0B7g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gd4Py5BrL1jPcmn/MGSbX48BDVB3x5tLQMaAHq/ZSXRjcWMjHtbfQzzFPWHr?=
 =?us-ascii?Q?t79mXXU4nDGq+QvHZB2xASjjYaE5pzTZzeCuzW2ktPPPBwbk1HTMqsJE1Jju?=
 =?us-ascii?Q?4z+OOnrCim6OkyKkC6oHvIgzwx3HsW1tfklIPEjdlWM+4ecWCqZhufpR1hL2?=
 =?us-ascii?Q?yiCERp7hx3wEuGaYczy3PqKU0er7NsfbYsm8ghTLXkYbv4PJMGL3znGY27aV?=
 =?us-ascii?Q?1PNnh2kiH16FdFpudz1J4ss36MKCmJ2eAsyJ1Pe7SQ0srpAnIR3g9wNDruPi?=
 =?us-ascii?Q?ZWg/nSCNMEnD62pFDxHZpps6uLNrFEQL3ANb/983bZmtjjaVAQ5XyRbvSVxz?=
 =?us-ascii?Q?p/ETvYXhjPdZSJSDubSRRUs4rS/5je1EXVQw6OEekObeEzOEqlJztkUURoVy?=
 =?us-ascii?Q?UtEyV/Q8GBbCJm0QkOYEGFnIr7ICv8aYB8szL0j2De4bXgMjewXyka93OMh2?=
 =?us-ascii?Q?eMzxVdZBcMriItdluW07un8IeRU8Jnuzr/PXydCcspIDNoFXwbMheAM7bFhO?=
 =?us-ascii?Q?ai0ZUKAIufHrXS99uZXUnBN8iO/Yif41esOgdqTEe7klhyNGGUaofAvhWma2?=
 =?us-ascii?Q?/V+1iVWPkCLrt6V4x5nCcECwoUFXPhmTsYczxtj5baW9CXVQnA8EyzU1JYdA?=
 =?us-ascii?Q?lDY/HBeTNIMtlfoeLfnABh0rG0Ygvr4VlM/QypLxYegCDij2lY1Lm2nZWBw3?=
 =?us-ascii?Q?PUCDkaH6gu4ic8svOAnEY1207+ZYCvl90RmTfcwlRrW8i13MDV5zI43hDGbQ?=
 =?us-ascii?Q?KL3HfD6vXh1EfVIUGpNX6ILI+KHmW7C8Ihk2avRkUUliZ3M2+YVCRmHaBmKq?=
 =?us-ascii?Q?BrgrtoHhj7wuv+CQj3cqzbn2HXoBpiEfBT29G+6oXrG30K32uDMVWt9G+XCo?=
 =?us-ascii?Q?0diNv7wbHzO4cTVutt6XlhJPDtH9yuELuStPYhHmklU0fk3MrzqjyXwffIKY?=
 =?us-ascii?Q?SfbZYkHAaHJf+952gEb0jFcPNK4G7/utHb2KhpuXC8vj3k0/g10eVDbLOosU?=
 =?us-ascii?Q?oIWqqIPICsbBV/4q30QC7+JzkYQ76S3wlI4eNUpnK1gafG5MZsiuvNGsDCxU?=
 =?us-ascii?Q?lnDDXcQLttaP1ojN033eejb8yWiWoqgjyqH8e9q+YqvoXBCqVqI9v7Etrr4l?=
 =?us-ascii?Q?40lgXINShraco3cR+qty1+n+77kjOf3utmPBSEYEzVZqbFEQ7BZ3YPfTFtsR?=
 =?us-ascii?Q?1KJBOT/Qu70hre0IRStNAwQae8I23czK6CQt6KX8HRB3s70HGaBijYw1fLQ0?=
 =?us-ascii?Q?7QZT5cMyv9E/EjdArcUQTP/aCXLWsYnq7BCWPnCXKzFf6FlMc1rZzvnx50+a?=
 =?us-ascii?Q?kcexHzC2IjpGZ6g4I5i++fYnlFjA0rR5sH+m2SWamZ9kLymGpD8aWSuhO7/B?=
 =?us-ascii?Q?3rd0caBpz8U/UY0lSGejZIqbA5Zgj5JRgI/2IsW0XKMhzlHWWzjSvOy5d0oT?=
 =?us-ascii?Q?IsN9BOzWl6k615sOGz6hWq6fbNiyglGy1uY6R82EzDWOpo6uFm6OqPoMDGPB?=
 =?us-ascii?Q?Edd8Fzz5c7wormzAEnVQOJCpC82CbyQd1xsjAy+XW5N54Ryg/+eXodTYb40y?=
 =?us-ascii?Q?p3r6H8F+JPwHLU6++JaAV/V9HZZvF0SBtW/7iAypBin5h1fHOL/Sw5WTQ0P0?=
 =?us-ascii?Q?t2ZPVqBjhqa3PMpEgPxLAbUXYgVfV4ZCGfXhmWykO2gl/UdUpDTpb0J0BldY?=
 =?us-ascii?Q?REFI7//Z3YciWhKIpCypx+UjHdWvpxMQmK9gaXbgrGc29wQ7gzQN1He6uGkM?=
 =?us-ascii?Q?OZPDfNd3vg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e31266-9dd3-43ed-63f2-08de60639605
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:36.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btmcalk+h8C71FaAJvWHmRCN0k9yGUBVYjRLEBPGazUPa6dzVPP93gs9cqoytzFMHfuTDbc693gqfRnKJVHZ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

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
index 081b9fce9278..33d0408eb852 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -93,7 +93,6 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
     ///
     /// The FSP message queue is not circular - pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(unused)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
         let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
@@ -116,7 +115,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     ///
     /// # Returns
     /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
-    #[expect(unused)]
     pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -148,7 +146,6 @@ pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// # Returns
     /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
-    #[expect(unused)]
     pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 4f7d121f4240..dfd0ffe5a650 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -22,6 +22,9 @@
 
 use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
 
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
 
@@ -314,4 +317,102 @@ pub(crate) fn extract_fmc_signatures_static(
 
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
2.52.0

