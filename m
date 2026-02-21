Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC83321DC;
	Sat, 21 Feb 2026 02:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639874; cv=fail; b=mS11HCij68AdUqPut+jbS3BOLAueZxjnHo/6A04D0l0gn4jcSYdD0C7eenT7IfWpkYKM2R23NrA9CbB6pxlKbeK7hFXSOTd6snj9o73Taq5bxMCUbMDItIq/LY/TxtCvHpIs3/VA3U98VZNNuq8QLJzvv298JWW+oqCifmiH47A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639874; c=relaxed/simple;
	bh=sShggRMd+ekMGUkfd/CVxgHl8AozYqJ2DZPOp63KH9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DWUEpNoV9LCwQZ00Y32tqZoRYuwFNRCNYzG0lVo7BuBGahMTwv3JCzM8BEnNv+O6Aoko7osor8y6M2GHCAy7g+RZfq8MCTIs16W8EucN2eSRglJWeQnUynhJhXfhBpZPVeixTBXkdUcpVNK37xacx9NsgEX2o+1REC/AXvyAaAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U700G49s; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U700G49s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+4ceEpniKyQYPCenN8lQgYXX39SQNNzh5tGNHSfhMRBSJJugxWOp875W5FdJItLefrOp6nOjHbXnkJ9F+nOaeIJF49TnEyZ+hieCoSJcwi8OrlkxlrTpU9CUvGwqBzLt13ZVpxS/rKYfIunNrNBoNeBRJjnsD8GTx83ouMcB6KTSLkRaqJpNvSMuoL07zUGny/WpiHA0xg/BupinuwaimXzwG+/QePyYvRGTU0SEmCMScopG7N+KjpPUouHRqjR0/c39cRhTt6v9NOH3Fk4FZ5Irmb9WjMKjiALMcpturWNhll4+n0l4qYARe4YzTR9U1RPx8S7Shl8W8zWqT0b1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiiW9n8Rju6DW1/5dbzF0tRCqtkd2RZzkTQJ6TrG9bQ=;
 b=BbdwQm+imzktOKu6ed/wOciZ5bs3422ZetyrfLNz4i+qBMEjSBypPlrmPpJpYOT6uZhq8tpGFR2wDfa2UVVLRphWgT3F3i9WzSvgJJzpywuhDokvIpM9KLz1VTt7JUyt3JKWqMGDkkQUSHRUWLVj3xmPqwcJyojcWzcpII2W15TiNJZdUyRgFhwrftl+OI62MwpLy0Ac0VOee8RqBVBQAGZ5NluZipvlB96rz6J7eHOnzLg/9efCS/5FWxRfqZVzWCklzExSmPj91F8yTFh+rrn98IUwF/619oiob0aQFDIsq0wit+cH+XKdBoH7oq6X/gHLx7xByXdusdQrSHA6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiiW9n8Rju6DW1/5dbzF0tRCqtkd2RZzkTQJ6TrG9bQ=;
 b=U700G49shPAptob6hYzXEj9fegKm+IzOfLkCv/uFezojbtcqQbEUWJQt52Lj2Z4hLjb4zxmswGqEjLZuCOU1J79J58cgP1MmHpFesqDHXA7Jc9ZfVCaqgHrTfk2iV8S/xzGd8a2w+u4V1U/dSHXd3TtLPZF6J9VMcI5TPacRHB6Cjc2I/81ZpvJ00Z6ttZaAtoftYCyP34yLy+Fv7dLXF6Ynzmr71jRt/c4frkh4kuc5jYM456o0ksAFn+MSAurwMPa7ufaEHByHgykoPx0nmZTI+yHLtdqv808Jh9jDbpokCvNqTOGT75gaB03wfVHQuCsDtgYdU91/rRzosvaa3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:28 +0000
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
Subject: [PATCH v5 27/38] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Fri, 20 Feb 2026 18:09:41 -0800
Message-ID: <20260221020952.412352-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f19014-ae7c-472f-75a6-08de70ee61bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?laYx6C9U3HNysiXfuF2E85PMsNx3jU5MmW9hSJ7YdPYZVtZPU/d4lxE3BgJd?=
 =?us-ascii?Q?N7BH5DvniPweENDnoVSVLbSwg1Ah9u4qhbilq5gnIBopozVTsRJS9LhAyPT2?=
 =?us-ascii?Q?Gba/QrjwFySJKtrxbgksTAetBf7CJghcy1RWbk9m68N2yg1wup1bT1rTXlFj?=
 =?us-ascii?Q?aCUaCwe8D7BdL7gRkiwTpIk8elCJprsnAASAfClM4p/Sp/6Aj3PJss9ioh80?=
 =?us-ascii?Q?nZAHj3i+gVjD5H1MVFzrx/k4iqK2vAPs+9T+wSSnF2JEM/6vonSxS/nMop3/?=
 =?us-ascii?Q?VmP5nTZq9SiGIsAYgRMj+DXBzpjdyBegSTXB8GeXHNuL9tl8iMuS+60B6sEQ?=
 =?us-ascii?Q?C+zaz9+90fLdZmp2ji41I+LNilj5ii1k/fF2MYzYSVTp/c+a3FkATWN/+xrw?=
 =?us-ascii?Q?LSAMn0+7IzXOnKJ4iyE/1569boGzhMWPk0ljCBQEEcV9YC2//Gs9sYjci/8Q?=
 =?us-ascii?Q?W54ymF/madlD/yFQL8GEZKr7M2tmPh6zVUoEAxE3nhPZVL6Z8QBYDupa6EqX?=
 =?us-ascii?Q?++DP/yh/EEw8DkGqDztwbYULh0upMeCnUmqRCcTfw1fQppodZMGNeRcrmSKm?=
 =?us-ascii?Q?y6+L4XdPmzDkZNUjf8vFHI2x2OMV9EM73uFw3d72JwSSgyya6PYOic/s9J6a?=
 =?us-ascii?Q?GVH8/4NQbkn1ne73yS86f0sTs3wJOGmGzpqBuxiVFGJnGwTu0dC3WfrVNR3I?=
 =?us-ascii?Q?9xi1smWOnuYK5sH/UXz5rHw/LC367fG12Xx/n85YzvZtzzHi9E+kKTlWAkpI?=
 =?us-ascii?Q?pmcjn48vefcEpv/k+o+jWs8vLbHDWxzXAW5anWCl08TJPg0nTfBiZsosUU3I?=
 =?us-ascii?Q?wcA9+18xudghO+n2DmOJxKQlCwnD2ap2d3kpteJ0qbqroFykaQ9hKtGmVt4Z?=
 =?us-ascii?Q?CGpO+JWEhmTrsu0aMuNGyqgUVqJimZfqiR1yxaDven+P97/dCjAvIBzHxh5N?=
 =?us-ascii?Q?doVcAzZu2kpPyF1ncpjcooHFovv7AH4VSAv0q7haaeU8e34OxnotYv7tyyBK?=
 =?us-ascii?Q?HY6uNFfmg+o5GnsN+JOqg8HbeePtQI0Snnwl5btayBEowcgKEPh5A2Dz2Lwm?=
 =?us-ascii?Q?/OB8kjx80nH5ULY77boIiwHfAHFA8a4I4WhPXgbRob901bbVOBRT/Czc1p1r?=
 =?us-ascii?Q?Y0ZvqZhd6r4M/Pk2P5Ida4Gp7aeZEvOnRyeTX90n9aTqSc5JzpDTSo0gpJ2N?=
 =?us-ascii?Q?0JMlXQcUglJJ4Bg+gsH73sa3YNQTGw5nB1RNZoIbLHs3hudM0unx6x9OF2Su?=
 =?us-ascii?Q?TPKDQcj/0BSTyr5HmpclSMrrF5CRr57YeQ1sMFJekWhopAQbffJIhZPnwXX3?=
 =?us-ascii?Q?zPgtuU/AtT6u3K0SPAaYQiqDBPRUspx+I6Vkk9xs10B6WylqkXtJvmv+57/S?=
 =?us-ascii?Q?JJkTPH71sRDv7sTdKw5sbg7lDMpc78jSsgXgSWE4Gevcu9UTi+mHVOm2utpy?=
 =?us-ascii?Q?bjUHbo8Ww5uEpdLtQUCNS94R7xKZNCDYkT/hgjdRJJ+Q9ETXIEJKtJQ4Tlvh?=
 =?us-ascii?Q?cyGfzVhACL6JsWY/2QB/hQ46FkzscYmJ5MVtHwr9bGzvyar9o71i/OPWKHmk?=
 =?us-ascii?Q?qkSb2Ur2aiLmd8/ERyc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ePqxSqemGCjIA7IIMCHvY7AHXNBEbAmtKmImu0uSYQwVFP6grYECIMLVOAI?=
 =?us-ascii?Q?9xTdifD2hJSnHAcngHfOQq0Twb5VSTs4LN/k+yX+mHYm8JbxLajGvnTcqCQP?=
 =?us-ascii?Q?Kt7MBdMwv9lmF4rOi0LDQIxBAjmiLuOgpBPOZP9MTaYRbChEM5edeu1saLDB?=
 =?us-ascii?Q?oFEmm/3aMeYl74GJAgfbow6LRfocEQYLQt0Q9YPgx1DDj8C/iMplmu7r1ztg?=
 =?us-ascii?Q?Je7oT9PIp6tsgAdTp5AUW3WJ8C/bpxfOEUCjKnlOIRBc8batuFh8817ydxD2?=
 =?us-ascii?Q?mQJQ+i3+2qjoc2HCvgd6x7iLvkxWsHE31wSawUdo8mnW4LHEqlhw+lNTHZg2?=
 =?us-ascii?Q?HLGPpnVsb3kCqT8ThrV9utp9W63jBUbK+UL+HZnvToMYLiMSNdp/ovKoDf5w?=
 =?us-ascii?Q?Mw8e2zzkQclyAFhHJkGGkVZuCGBj3HzNwDIkpdzdyihNSreB6QMOQgzd2v4Y?=
 =?us-ascii?Q?y0eQoZZOLtabxc18VhcQ/G5lm0h+IOV+MmPSe8O8n8x0ej+2/eAB1A68MXWW?=
 =?us-ascii?Q?dWgAgxnN+235WKfuStkP5lpiYisPSx+JFLVqf+8OqhvF729jzfh0KB4w0hEo?=
 =?us-ascii?Q?QA8qxmYauPTHyKUxOowxNshgJvS3N06Ud5CfVuk2sQJp9PqwI4ndWWz+wP26?=
 =?us-ascii?Q?YFTRc4fKD7eQzA7OmiwlCQflzdswDsMIX6i5mGfli3GNeOqmlUCJ5tboI243?=
 =?us-ascii?Q?bJ6XQEUBh2zvZ4RQDO9Je1g+kfcpN0mGHJotYtVtIRh7S1fdo8gaGPzDVYot?=
 =?us-ascii?Q?RGmv4nlfDUxbADEx/OpxWFhtS2fWJFuqG2V+88vL5zJi/AQEYqM4e284yFpt?=
 =?us-ascii?Q?+FVEX151HMK7U5R3KruVGji/AYI27oZPvV2jRc6YFUVWGtsTCDDHil+3024N?=
 =?us-ascii?Q?NPlYtU9XqxkZWhyz7n4hTFJ2NdAySrriQ7KIxSWTY2c2L01HbIEQTULPMd5x?=
 =?us-ascii?Q?kvbQ5t+Xt/OGiCfFgKN7VbaPXHuLCiwK2lCyqf2fQXPo8toU8di0PgeTNkKd?=
 =?us-ascii?Q?8jG2Os5cwbGGKB9QXR0EyAPkHWSqujUUPYmSVfQvZPmXZlVjxiJxDR12u6Dk?=
 =?us-ascii?Q?f3dKagRBSbk9ZDbhiYw4FYfAjxVXaKO0GQ6nFG64eS/qWZdF4na5HfNBaDk+?=
 =?us-ascii?Q?E6TZGckRJF/YElYHKVtKvNzA3NxlZy2WJV2PvrMKxTe87JH7jjdUJOlWETRw?=
 =?us-ascii?Q?YbqFbiM3Hkm3Y++PKKfNHXopx2bIT5dUowiAGs4KoKWGTfcTYkgQlsJSDaMg?=
 =?us-ascii?Q?x2vrK2qW048UvTDq0BuwFoE6K8gi1woSTpcMfyUxrHCKar3jJzKKkL4eDQRU?=
 =?us-ascii?Q?gFpkeLQoLe3uNMA4/7tme1eXUN1DPdH3I/IBSWL7en5OtvAyYbU3XvHYBvZF?=
 =?us-ascii?Q?6qH4rkz5feWgTKzc8zpdLXhHKKTw4lAaflNbT7qbXN0kwPeRljvSUgNshAZN?=
 =?us-ascii?Q?o2WHRYLPJ6h21Zej9VTHzPMZQbpoMneEYYr0j+K1usiQRTdc/HMIWYOn8248?=
 =?us-ascii?Q?BnToGN/00lM9vwp0ZZ9Mf1dvROIZpUzRT0a2cpk9oTGpdvKwlM5h+ZGyBm9Q?=
 =?us-ascii?Q?Iu6EW7svs7kg61yJtoV7LNAtcaZfMMK43ephIS9DwPHzogj/AvcNcLv4Idnm?=
 =?us-ascii?Q?ZrQoI5mMlWUWibGlXdVeug0dkstEpdHfCak2t4YMsCU4r/NPOEGE6qtQZQqs?=
 =?us-ascii?Q?UrXR4BTEhLsWmHM1y5gemzxP8kDuaen+faxbT97SjjuriqX7Wcv+ziEubRKv?=
 =?us-ascii?Q?1xqqEF8A5Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f19014-ae7c-472f-75a6-08de70ee61bc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:27.9346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GkjETAPu3/n7pR/N3Ez19M2r0UzJJ452r61o2GGlHDfsKE5W+MFSiI8yu6ZwigW4yQSws1QPuZirCX9dhVaNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add send_sync_fsp() which sends an MCTP/NVDM message to FSP and waits
for the response. Response validation uses the typed MctpHeader and
NvdmHeader wrappers from the previous commit.

A MessageToFsp trait provides the NVDM type constant for each message
struct, so send_sync_fsp() can verify that the response matches the
request.

Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs |   3 -
 drivers/gpu/nova-core/fsp.rs        | 107 +++++++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index d68a75a121f0..b5a0a2631ec7 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -152,7 +152,6 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
     ///
     /// The FSP message queue is not circular - pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(unused)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
         let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
@@ -175,7 +174,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     ///
     /// # Returns
     /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
-    #[expect(unused)]
     pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -207,7 +205,6 @@ pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// # Returns
     /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
-    #[expect(unused)]
     pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 29707578d4d4..20c439fc7f7b 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -19,6 +19,15 @@
 
 use crate::regs;
 
+use crate::mctp::{
+    MctpHeader,
+    NvdmHeader,
+    NvdmType, //
+};
+
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
 /// FSP secure boot completion timeout in milliseconds.
 const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
 
@@ -159,7 +168,6 @@ struct NvdmPayloadCot {
 /// Complete FSP message structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-#[expect(dead_code)]
 struct FspMessage {
     mctp_header: u32,
     nvdm_header: u32,
@@ -172,7 +180,6 @@ unsafe impl AsBytes for FspMessage {}
 /// Complete FSP response structure with MCTP and NVDM headers.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
-#[expect(dead_code)]
 struct FspResponse {
     mctp_header: u32,
     nvdm_header: u32,
@@ -182,6 +189,19 @@ struct FspResponse {
 // SAFETY: FspResponse is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponse {}
 
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: u32;
+}
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = NvdmType::Cot as u32;
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -275,4 +295,87 @@ pub(crate) fn extract_fmc_signatures(
 
         Ok(signatures)
     }
+
+    /// Send message to FSP and wait for response.
+    #[expect(dead_code)]
+    fn send_sync_fsp<M>(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        msg: &M,
+    ) -> Result
+    where
+        M: MessageToFsp,
+    {
+        fsp_falcon.send_msg(bar, msg.as_bytes())?;
+
+        let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
+        let packet_size = read_poll_timeout(
+            || Ok(fsp_falcon.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::from_millis(10),
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP response timeout\n");
+            ETIMEDOUT
+        })?;
+
+        let packet_size = packet_size as usize;
+        let mut response_buf = KVec::<u8>::new();
+        response_buf.resize(packet_size, 0, GFP_KERNEL)?;
+        fsp_falcon.recv_msg(bar, &mut response_buf, packet_size)?;
+
+        if response_buf.len() < core::mem::size_of::<FspResponse>() {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            return Err(EIO);
+        }
+
+        let response = FspResponse::from_bytes(&response_buf[..]).ok_or(EIO)?;
+
+        let mctp_header: MctpHeader = response.mctp_header.into();
+        let nvdm_header: NvdmHeader = response.nvdm_header.into();
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        if !mctp_header.is_single_packet() {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:#x}\n",
+                mctp_header.raw()
+            );
+            return Err(EIO);
+        }
+
+        if !nvdm_header.validate(NvdmType::FspResponse) {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:#x}\n",
+                nvdm_header.raw()
+            );
+            return Err(EIO);
+        }
+
+        if command_nvdm_type != M::NVDM_TYPE {
+            dev_err!(
+                dev,
+                "Expected NVDM type {:#x} in reply, got {:#x}\n",
+                M::NVDM_TYPE,
+                command_nvdm_type
+            );
+            return Err(EIO);
+        }
+
+        if error_code != 0 {
+            dev_err!(
+                dev,
+                "NVDM command {:#x} failed with error {:#x}\n",
+                M::NVDM_TYPE,
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

