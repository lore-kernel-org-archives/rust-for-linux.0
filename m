Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521A333D6E3;
	Sat, 31 Jan 2026 00:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821002; cv=fail; b=dxarnVkmSy555KWgX9DGw/XyUUsL9iYd6GzUVnJUmEI0Zmecmpo2eIlRogIlQ23C+BqovXTAsZCgQ3FyakioA2k8munhqFpa/lVSAj0rB5WutADiZLseeWg+lJf8ehvA2MZ+5M7G2tMMQnTMYVcz0y8ZCi+yrvVLCuTze1TAUhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821002; c=relaxed/simple;
	bh=eN3hA/yyokQY3N8+AxjnjQe7dpD2jnMrkQrcagebiA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oo6TIHcqqLaa73k7eb46ry5kUHODX3YlLJUWtmB9JsAe5n14LpHZMF9SxEj+0aLTIE/6bPeuB9o9cBMB9+GzlNm/RfuFXyxQ/6Lx+qNKcbPkp9P1hhvyyjezixM8UG3lwkH/vlGaDgKWg1TJnhXdEwu9rKsz9YFg5ufOE/Lph9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cpM0ADuB; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cpM0ADuB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCWcdJ0/dCmm3wcBUCs0qTjoF3seXTFijEKL5YLiwI5ihkUBXi5MVJzjHfXATpQNcHyF1tkqXJ6OCymGzZOa2QBRkvZbvUoQZ8XuX4j17QRMzeLgX9gse1OQjFtMHBVwE0st90LPtgjQjAv59Bn5MUYsjBDQi1yfldFjkQueALItR+uGz0aubnKrLwH2uLoa8OtbhjaIF06BnqbjJSnHBK3q4hmRYE3l/ShRkKnCxddo2LOQcNjjG/Lxfrf6Ff5s/mS7Tf40OZ/92P4Qof2cFrGer+c6ofrWd9mxLCltwsu2J9UsGhbjuswdOBDBv+IFanbLphSh+7hj6KrdVLUf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzIQnjF2UmK0xI9ZfXF6JtUbFagxdGXuBM9MVFh3cA8=;
 b=ZNweSzcjggSVErtoX2MN8VHGcqMJclpLsgpqBa/+ZRUmMGLq/D6UYmjeIAAuqk0RgTUlRMk4Q9tuxi9Wdf4yqFTBNiCDGKs71PcXKeKD7zqgLblPViMN4Ud1WDriJNTrHsntQo9UI1/heyqJHoOovBdXdZjvKQ598a+yP020IwCTYPsxukdjGOJ8Z7wVmW3vE+gdjzELhl4Uk8YpiKq0sWwerDZqxFWkD9KcpJBsztpIRyDcGdyshDD8zZ7IBgN/HDcIr+jTDOxlEZ6YBbBsEko7rNv6bHblflVtxyU74HtFHx+4vlbMbdhQfHpnSyurBTOiHkd3r7P+w6J5tncYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzIQnjF2UmK0xI9ZfXF6JtUbFagxdGXuBM9MVFh3cA8=;
 b=cpM0ADuBx+uOaci3SDioyo+biUrJ6CBySKCopJSxeOlu0M6awOhzYxjdzfACK72neqlU4KZes4B5L1vNc4N50x98ZcBFQYcYNryGwYmaafx+3anVJYiAGMYkWn8KKEkOrMv6JtCPqkwPk36lpV4t2KYmoVQViDERJlSr3SjgoBSZI9W9vD349y/NQLlpOnRUnc8cBvLbfVB13TOJJxEaRII/8VEqZ60LhzQqA0BiHfzALanAfWToO8nTO2C8L4sAVEc444S7AHLU3MknJj8AowseWKQfMG5MVYFB7q3IfQOe0FWyXZ84nN1UrNGpwzP0GwRPUPTH8MsJiN4W1hH5nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PPF16C2BD7B0.namprd12.prod.outlook.com (2603:10b6:61f:fc00::607) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Sat, 31 Jan
 2026 00:56:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:34 +0000
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
Subject: [PATCH v2 20/30] gpu: nova-core: Hopper/Blackwell: add FSP message structures
Date: Fri, 30 Jan 2026 16:55:54 -0800
Message-ID: <20260131005604.454172-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PPF16C2BD7B0:EE_
X-MS-Office365-Filtering-Correlation-Id: e858a677-c2c0-4c81-22d0-08de60639482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XbbtydFpbE4N9VFYRvnLTjz7kvOh0RMx0VmhlBcEz928XdPG7/D0iJ361F/K?=
 =?us-ascii?Q?7tMm+9nwKWkVczZ0bDDDd0sARNoMaIzQQnGXQkcAvkhBYtdj2ivUypHryHZ2?=
 =?us-ascii?Q?qr+kSN+njVQy/bn8ePiaLZgHsD72dVxBZac5m+POfJ67h+bQpXwaknx1ypvB?=
 =?us-ascii?Q?KNwU8dhPI/6LTZ8TY+ko4kNbEwG+Ct2R97nIJBl8R5wqFgOSMMNs70+SFWHS?=
 =?us-ascii?Q?+iPaxVIWCypV5C8KC/3bryxQl4n9PlaQ8vOo6nRH/hq9Ayd/FDqbTsarvapp?=
 =?us-ascii?Q?aAgSBB7KvpPsjRNKx/fizCroL5bDXDah/ATI4oFS436sz9vk/OoIq0euwDpX?=
 =?us-ascii?Q?FUCL+/XMNsonDdfS3VKXoZWRvgi8qevLSeB5o82LV2OMWVLsOP4mpOSZtAlT?=
 =?us-ascii?Q?cH8Ye927Qs68VgunTpLhGUtEMn5NeiTY5Ne6loiXDWTEqfDmHzJa7Hic3VTY?=
 =?us-ascii?Q?ehCfL2Q27Hp+hgeNN37qnXAZYmiWfdVv/GrRx42gRN23YnINiOdenZyMOLj+?=
 =?us-ascii?Q?TqGujNfnGDoArwJuiowTM3Ud/uBgL62iBPV5dEv4p7E9JEMR/kTrNzAU0Q8d?=
 =?us-ascii?Q?57fXOvnCVVcNL5Ue0V1yZBBfH7nHW11o02jz543lhBnubBk7X/rQWCGraC+N?=
 =?us-ascii?Q?diOTwk5/mS4gRRb0cvgPHY9gioqdrkzdZVYBF0GufE24EUlW5PhOCWxq6GVk?=
 =?us-ascii?Q?TLr9PKRSP5KKz44labZmZaW9ca7uUzmQZCQ/vO/3Ka4TtXQLM11hnSSvh43R?=
 =?us-ascii?Q?DEo5uEZRLbvWlrBrgsJi2vsZgtsJhHHJbKCa6dA8yVHkYIYxssr0GxirESGJ?=
 =?us-ascii?Q?hjis1lwQ22jAIzQWKH1ErFuSXlWisqV+Hg59LQsOe5X68oCqTpEYR7p9XFSM?=
 =?us-ascii?Q?zgcHTH3KCGW4hBaCDZJQZV7vg5AZDwfja9368shQR+p3o55qLd/jhfuHqleh?=
 =?us-ascii?Q?Xx/X2vIaRYV1w1EARnCXjrK33//mRkzBmKc/uYJ7j+SdYcuPCTeFosMcuZYv?=
 =?us-ascii?Q?4StlH/oC4mp1tLCFkuB7kbdVWH45iFeWwgBFRnRxm/MmfKkToiJZf52gb0gx?=
 =?us-ascii?Q?mzZVjKhn+eJ8bndz6aR55bmLD+dpu74bCsxw5aqaaq/dO5Bc+5y68e/pDGyp?=
 =?us-ascii?Q?TARFkTCEB6opmT719QScWgut11pDHfsY5u8iuOqWfVLvvdGDsC23S2NZeZLE?=
 =?us-ascii?Q?CupfZP5UZFbGWk74Cpyw1HJgDFWbTfoL5uwA82NLplzIXW++K+PuOUFBOR/V?=
 =?us-ascii?Q?XPoC0+LqsP9ZWHVHh3iiJqUxvsox5u7XdLyELBc1I1+woySDv+PdZ0RSdppC?=
 =?us-ascii?Q?hkZzJSW6rGnR6IK7Yhus1tOeVH99OYZsHC7Gz1hU+QCHwEP/1XYJ651oVNH1?=
 =?us-ascii?Q?wGKPEJXoSGLTu3mqk5OUDm6f5qdccYbf16V8jjL2rOkN1n0HUFGorFID7162?=
 =?us-ascii?Q?Du9GdSRAoAP8X60cNS/umT3GXcDRidOuIYDtU/K8PvqG95PDkrXbBHGdW5bs?=
 =?us-ascii?Q?kh1rDxmnvoEWIOB/0JeyYYU4b6U6pWztiehibrh26OExIT/UGrcd3WHTPAGE?=
 =?us-ascii?Q?gvY0RTUIoOQdTTzv9IM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kk5bnzNvuLwd7cSTCJfFNWOnZzPmlRB93rbsTTbz+sa0Y+pjPsjLtOZdtWTj?=
 =?us-ascii?Q?D4KpEmDFni1EwscPSbS0VPdSGxhKoIFyzm1VHUwlLvhMJGJDz2Dm+pdHLEWt?=
 =?us-ascii?Q?3W2hodFBT2FH3eiqf7KKW55pjOHep2nNfsCh4hNe05EVUvzTeutFeNkpXjP8?=
 =?us-ascii?Q?1EU/+EnbUWZoJhrw350HKgkPuYQaYJu2bxzgSPN1ynYscjAD9c1OZQFviXrd?=
 =?us-ascii?Q?CPt28r253emx6Igc8m1vGxXwJ/f/DIOA0k3yiKVYPoi/l5lOuA7C1YqcPO4B?=
 =?us-ascii?Q?MUt8HT7FSX96+ru61KZNWtIOrhU2yU2Pz+9PxZtHngZo6DiZL382nMXikqUz?=
 =?us-ascii?Q?NFhB4dDLqTP7B9AEqtgQJGZOdWVi5rs0SHbXoztfIkdfSBOFCqowBGwd2BOj?=
 =?us-ascii?Q?ENNlKzSVVgabc72wXCWk4XhBzEg93WSJ7bBBQZ2xmw/sj57wGXz9LUt4E4QH?=
 =?us-ascii?Q?UWyFwKTvk+/mnqn3K8N/jwuo+vUasarArFoeyE6E8SettDoh4XSNsQDTEKBd?=
 =?us-ascii?Q?GyAiZu9YF2DCjJfYOskUoqEYiFndTo8RbDkWyjU7wheHypLCkRDI/+fIIqg0?=
 =?us-ascii?Q?nnWds3HzBTMBqxZlfJ2/Am4sxEtFImIPAftBgNYanS0hEBEtvNg8Q+De/HSK?=
 =?us-ascii?Q?x5l97PVtUWYOBt9YKZoPNcnNWuzGLEN5lzUBlUiwXKZeN0Po9BdDNJs/EOWd?=
 =?us-ascii?Q?dTTgYowdZthLOYkyYNP732W9I7nzxcAuaJph708fMaC1Aa6tsaRjYcXcrTZC?=
 =?us-ascii?Q?QppbXawr5Q6j2BH5M2lsH3wIp5N7b+F0H8w7hUu8gsr7gI0OWqLpGLdnduzr?=
 =?us-ascii?Q?DWwnLFzToo3TH13wq+AmdkUofnXcgs+kLMGCo0xmQKk6NiXjeY+ctl4nNOgD?=
 =?us-ascii?Q?kD/u3NBT87GKKslzvOfa2NG4zw2+879CJiWrd7jMmou2CrIgicm+rRq6uEWN?=
 =?us-ascii?Q?ch8dEpJ5FwHJQR8aG619k8Sq5/IR2Bi8O77mfsqdr4/jAawPAeTr1Z6M9QxS?=
 =?us-ascii?Q?ojXP1A542hoOGymCNxOp3cwogZhoZN09XnAHIak7hFdmXz4YUpopODMXXERo?=
 =?us-ascii?Q?8ikpivKFnldbvv+2A2BZq2tDlvUnr2ZBbscbRZMzL2G8j1LWJuxp/6h5tSxI?=
 =?us-ascii?Q?tSkv1T1UIg7WifijkZHbsuNXS4bsTt+54yo7FyWMFJ767tew0dMlVK94b+L4?=
 =?us-ascii?Q?62+GohExo2ORxLt6g2b2FWjmaE5xAg7VUXxLsu+RNUX9Ea9ykxTlzU1Y5X6F?=
 =?us-ascii?Q?H2DWyEYkawXqLHd25dGchtvdOFIGqt5g6EvaUBLSvbJdX62Rt2vcKUkBIcX2?=
 =?us-ascii?Q?C7POM1K1GKHBN06yCpvGryd0yP86HH/HOwnwMlWe1vXpArVCK8PNCcu8WfS8?=
 =?us-ascii?Q?FB4ZqZCavWivt30oxTQk4ErNvxBxbzTlS4m7HDNdAIidz13Id/XJP8QppDgs?=
 =?us-ascii?Q?fv+eFrwg4FgGItMRJ3zT1QFLXNXkHre0Oukkhm+hGa1AVzwH2VxTcnAC7AAa?=
 =?us-ascii?Q?kD2HPArls1klSyCu1DcB7OSJRyiS5f68xmt1vKbkv24wgJCgocfPL3z++KnF?=
 =?us-ascii?Q?sm1TQT8KLkrHfFY/lov7JaUZWFtqt41w2Z/LWtts7Cb8se+bYCUBmeLyNlry?=
 =?us-ascii?Q?hqI7NANgyW12Nz9P3/ooDSNgC2htNECYndsBDQXPaTS3lqr2eMrX7/LAOArq?=
 =?us-ascii?Q?pjmvlc6Qtkxw3a1iUcwxU1191ojT5+JCvklJTVLYYmRB3cy8lJgUBxlt80qq?=
 =?us-ascii?Q?snSJHKaizA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e858a677-c2c0-4c81-22d0-08de60639482
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:34.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ev4MRWbpkFZmcpYRzmRSqXLLW3hoSKb7HR0lWmbt0V1rgDVHByPIXXNjQLIZ/Mx8q170Wt6JGF3Kubw8LDV6lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF16C2BD7B0

Add the data structures for FSP Chain of Trust communication. These
include the FMC signature container (hash, public key, signature) and
the NVDM payload structures for sending COT messages and receiving
responses.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 5476259d224c..c5f3267ce329 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -124,6 +124,82 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
+/// Size constraints for FSP security signatures.
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash (12 x u32)
+const FSP_PKEY_SIZE: usize = 97; // Public key size for GB202 (not 384!)
+const FSP_SIG_SIZE: usize = 96; // Signature size for GB202 (not 384!)
+
+/// Structure to hold FMC signatures.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FmcSignatures {
+    hash384: [u32; 12],    // SHA-384 hash (48 bytes)
+    public_key: [u32; 96], // RSA public key (384 bytes)
+    signature: [u32; 96],  // RSA signature (384 bytes)
+}
+
+impl Default for FmcSignatures {
+    fn default() -> Self {
+        Self {
+            hash384: [0u32; 12],
+            public_key: [0u32; 96],
+            signature: [0u32; 96],
+        }
+    }
+}
+
+/// FSP Command Response payload structure.
+/// NVDM_PAYLOAD_COMMAND_RESPONSE structure.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCommandResponse {
+    task_id: u32,
+    command_nvdm_type: u32,
+    error_code: u32,
+}
+
+/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structure.
+/// This is the main message payload sent to FSP for Chain of Trust.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,               // offset 0x0, size 2
+    size: u16,                  // offset 0x2, size 2
+    gsp_fmc_sysmem_offset: u64, // offset 0x4, size 8
+    frts_sysmem_offset: u64,    // offset 0xC, size 8
+    frts_sysmem_size: u32,      // offset 0x14, size 4
+    frts_vidmem_offset: u64,    // offset 0x18, size 8
+    frts_vidmem_size: u32,      // offset 0x20, size 4
+    // Authentication related fields
+    hash384: [u32; 12],               // offset 0x24, size 48 (0x30)
+    public_key: [u32; 96],            // offset 0x54, size 384 (0x180)
+    signature: [u32; 96],             // offset 0x1D4, size 384 (0x180)
+    gsp_boot_args_sysmem_offset: u64, // offset 0x354, size 8
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspResponse {
+    mctp_header: u32,
+    nvdm_header: u32,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
-- 
2.52.0

