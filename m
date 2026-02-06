Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018633FE2B;
	Fri,  6 Feb 2026 04:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351717; cv=fail; b=HIOVlbPQc3XWS5+msUrfEYf3xgOFNhLzAwkbKTdBWqC+M1YI6o3+KUiAzfIjphLMhTa1W7LQhVulfwBSSxtI7MxQWhUy/ZYV/XvtQN0hfix5MvACig8SqLC1ms5nvNPwutDiTe46+SGvYrgOZDkgQvnyQDKyQjZYF8/7bmcmIu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351717; c=relaxed/simple;
	bh=O6OI5XRf/7DwzqsDllblIc40fHBf56w8ixl1mN/C7MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VZf79beeNd2y3DaMu6TwbBQoE34hEoSM9wxAZ3vp3aIlEz49zqrG0FCUrExLTEVbRltjrPKOIfvzNfUwJhe3TSp8dY/aobZMdRuLwwZj6cQIJYe7TduRSCZ9CvdYjLCVUpImbnxkeJ4pzrC7g99m6hbkHsBJOGGW13FpbmgBuLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dwo1zjSH; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dwo1zjSH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA3x26c1rw74Cvvs0isFRb/oDm0asULSzYzloMpmhaKbQdMif9vfBdFOtZ2t5MnW7isu7fbysIfU5C1vghWfD2SvuwQ9bwOtSCXzRKO/gHyxGo3WBr+lIyUOdKNoirOzIlp5nJ96N5pAiXlFPmVsee4aMFIjNJxTTrzliJfGn5FpE7ne2r2zRodq7e4RC86er/2yCnDX/k7YjsHmfVpA9WoQy852wdL0d9CHhLXrKJ9JsPft7GEHD/cESjRQbSTAY1VtlhUbQPM36bMw1nYjLwASkSsPO7iE+YRAW3DHymyU/W2KZVjMrL8PK4bKX/8K41bQJu6M28jfY8ZrW3/sEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pVJ3G/d1NaMhvoFG69eVc7n7pV6h/oQBelhD3gty3c=;
 b=axlXSwBLagrCrk1+Dw3P1AbvJjlX0NS4qll7YCBV8hageP4IGColeqharixz+1+yy+EELVgJKz7If+4t1suXdqorCiG8Xc4UZPNsXnGiaSq1go8HYzjKYIdB3/dxkxZVCU00ZPlEIrBgT4OKOO9x1EN9+tOxK32cA2eR6y/y1nCOIV6Gr6S8+J/2/2ERW7wouTN2jij4Y1e6RAbTZqiQSSMVuT+pvWNL4vjk/Cdt7a1ELWJIKjxnX243aTU4UamMDMViGLPv8sMMntNXTP/sea7RCgQHQO9QpeY/OltNl8upAgN3oQikxEW7oQkmNs4/IYVJykSS6Ma5WJMIdz7tHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pVJ3G/d1NaMhvoFG69eVc7n7pV6h/oQBelhD3gty3c=;
 b=dwo1zjSHhAFzSN0M+jenjCugdZPBvmgEDlWexBkIofUJsBpOk/j2atxvnR/RW5NKggwKsvityVdnhbDrdIFI6qSIwsWUPpOZxWkVB7MK648rbvCn8Me5uBmbEK9h1Dggh1aQUeAfZJgc49fB8bbma4VCwQiPEFqx38ENDM8w/PW1fYJqUTrN4UCf21t+N5MKpX7VKY3mktoE6CGGkUuy8Q4YVXB5Ke3lDb8tFIR5EWSCzdMKWIeA03g2deRbYK+k2XBAXRXI90CJBVkKntK/iwTm495MPgUk2jWrrBDjn8wTTsoEg8AFIG/B4uZkWLR0U00z7Zr13GatH4uEysUSpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:21:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:52 +0000
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
Subject: [PATCH v3 20/30] gpu: nova-core: Hopper/Blackwell: add FSP message structures
Date: Thu,  5 Feb 2026 20:21:13 -0800
Message-ID: <20260206042123.303281-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 5170882e-ec67-4d6b-3227-08de65374135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1ptcJnb1JmwS7G+lk8QvgX/+eyfZ8zQQST8e2lO8trzzX6ShH7pZLnunI0Rz?=
 =?us-ascii?Q?LU2Hq3nJru9aUdtgM5jcz3T8W+hmhYgqG7H3qHH9Ana0jE+kvrlhx3nkI/3o?=
 =?us-ascii?Q?KYLXgYH/katZIBbJA/OBCaPxnYsqkvulfBTx62aGYEZFBxopog95Xv1fekC4?=
 =?us-ascii?Q?3I9yfdbYC0ckPdt0RAdHN1NPJZuxmEPexh2WI+DyVNPIIOqVBB6oUwMPHOou?=
 =?us-ascii?Q?x8b2uOTbrLxuTVhqBZTrrKfGzR3C8iHti/ZDZBxMvbp2YHecVUYnIL+K/FvO?=
 =?us-ascii?Q?3+kTRu7tLbfrzk/vl2MYnurxsjH5vlMdLc3FIU44I69wSemtxwsPBO6zia+M?=
 =?us-ascii?Q?bkbi/KjDIRHDpr+vo0EhRiD36zPQKEIGOcdPfHmGPGHGGxaJOl6GujBjeQrD?=
 =?us-ascii?Q?s+AUr6S4b54g3n4PDcJpDIMYKT5My/mGoL6cAXVWZnMV7HZNdD28wX641xiT?=
 =?us-ascii?Q?CyD+x2QXfhzLMD9GFRVuXiYKVYHjRTWAbbITjgQXVPzwQQI7MxfVKKmnoyO6?=
 =?us-ascii?Q?/lzRYTo0kLYiv3nh8v4fMNZK2Eu6PdHWXdarif1xXXz8XdIWNWpRsrk9emDU?=
 =?us-ascii?Q?4yz0VM7+gYeZm0RW3oNlVV7vtjW3h60djfrxV+mqENpwpEFe2VnBj39hA6/z?=
 =?us-ascii?Q?NZAVsESxfuMLjJ7eZwqnZMZ37HywRN5zF5Rk39P4wPoNrQ8aGq8W/lCHhz2K?=
 =?us-ascii?Q?XkCkU/Yd5wUgT/gdY+bh4t4YueitAsrIIsAoMk3bw0EInX/k8fjzBgQjltrw?=
 =?us-ascii?Q?yM5GbE1HtRg32UFDXt2q7jAhAMNm48EEbZryEdZYJbpWKTGgq27I9VXu1gOO?=
 =?us-ascii?Q?tTGzUtRaqCVaASu93+kymwB6mjgrKxktSJsRe9OVQOKUgZhCTEKOIJAYQv/Q?=
 =?us-ascii?Q?5N3OWNnxZ44RlfY3EvstFPFEoEwLrd7Kf06aRBIhJnMzZqVWmoQuKWitqXVu?=
 =?us-ascii?Q?HFF3khxm+VSdz1b+Lg8hiRhPMr42aw8xtqh/MyvCo1Eq5cYb2dcHtftgVvmH?=
 =?us-ascii?Q?HugwGrbKT4WFXmezDwXkX6bkJdxz5I++UeR6w9+HoOYLpfpw0Rax8VT+IN+V?=
 =?us-ascii?Q?O6JNo6nTUEHRr1oJYob2emWGHdKk71AkD5YbBtvUHrksjzpVW0HXnk0ixfHf?=
 =?us-ascii?Q?flwjY/RDV1oCRikN6EV4rDDgaTKZKx80CaT3ZbmZy1bRTuy2UJ4wtBJafZVL?=
 =?us-ascii?Q?sdAv+EGAhTUKpPBFzuFdcdZlgXK7vdWFpK67e3BGlbV8mcyg34IrBYiH8ocK?=
 =?us-ascii?Q?oFeARJjz9ZYmLhpN0jRlcc+toWLunKyJXKIDTQ9fJcqPcD/+mUmRARMRctaq?=
 =?us-ascii?Q?mtFjP6ZdkcSdb1fgLcNjvocIhHhmrXOOb6k0r/rv7UFUHJTK5Q5Yg7QYkdO9?=
 =?us-ascii?Q?YdnLUxMD779jvDgTOuA6aWVmKpPimmro22/dc2DVzdN4oB6GtuJ3zLspGtXJ?=
 =?us-ascii?Q?bOtv2b8mnTfMWahn2BwDYZ1XhDAptNJDdzKOuO9Yt+ZcrTT5Dlm/KhDvWAHV?=
 =?us-ascii?Q?NLvT568W0eTmb+fy4eYzMSV0NmKLm6j9X7+R0ep4uF6GMDvbs5kfV50vIBtL?=
 =?us-ascii?Q?hYj2wut+ksIu409Kb2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tmhW/4Hnlew7YByoIbXdrEVO81sATmrTvk58psuvnNqu2cmBPnTpEP5T5RXO?=
 =?us-ascii?Q?2KscQb9A5oCT+Dkq3VTiGMb6KZYNHiddRr6xAXMLNnzqesDkJ8984z76bmaj?=
 =?us-ascii?Q?D2J/uEbK0QT8Q3OkRPD1upFwhoDvS3umYuZXS4auCRFVOXl6a75oVCbLen5Q?=
 =?us-ascii?Q?l5qEVodG/98ALs2ooViHmvtFH+EhZ2lIeUnPXDozzxvuyqYsEaEWQwFaZleA?=
 =?us-ascii?Q?UFMqhFjAAGR4ukHQ3sOM2g/b9uokvGUD75BzGXWv/fsTQSzBK+fR+8LQA9qf?=
 =?us-ascii?Q?hN3CUHe3oyQyw1oR3ON9j8ruSZ7WvFVhA1yVTND4FgLgaY8WG3OkTQaX/Wxp?=
 =?us-ascii?Q?5dKI4ePO8oyUeEl9QQqK4cdAaqjtZjOD69HyFQ9ZQSXjeqo95vq+qcPCaRLt?=
 =?us-ascii?Q?y0J7gxIEau6+pyq2SNVVhuVtioayghCypJM9oeOIXPnE1JxDkMX5LSFpby/R?=
 =?us-ascii?Q?YiGHowGJD8AuTzraPCRMHZjwWDqXHl2i43UpEneHFHPPF/JgjYhlBKIGLGDx?=
 =?us-ascii?Q?HyYoZJ1H6UUjVH+g1+CfpvRbYpZLzNItfeMoGux90vtRXWTnT2WgxSNCXwUA?=
 =?us-ascii?Q?aRFxlfCn+0ZXu+V6a9bRusyWFvm5ocfV2JHmlSwLu32VUCUSz2FSZ2++DkbJ?=
 =?us-ascii?Q?EocMG/K3zRjHO/yj//SNN0jZL+aG9XzycEFiYRShZTnMsDJWeDXE0ZNPFzP2?=
 =?us-ascii?Q?u2qQJqXSAcGm1O8pckdlK/PkPVBiIWBSpNCd/bWCV4BOFx3cpbPA/cWhqwaS?=
 =?us-ascii?Q?gyyupkwP2qKzYCb2C2UWUCJowJU6uTq//ZdYOhE2BdEP3w9Z289cXFNMKamt?=
 =?us-ascii?Q?nVOxO/4G3DADFuprfIQDCuyy/y5CoZnY25hcFxowL5CU0s153A2jRNHrf3Ro?=
 =?us-ascii?Q?CmGZnUy75tn4laAHvVMQZHZJQ6BHfMrv4cjist9H8sq/LGu0GMCn2jgCyWmx?=
 =?us-ascii?Q?nz2EALIhud2s1s4nvSSFf3TzIedHkQLPLtLSHm5kuJ5F/4qkGio8ZBh3BygZ?=
 =?us-ascii?Q?ECmPjF/740eR+P4kXcSroa7MI9oZH8W340NrpOccMO4ZCZKnOZp5Y+3rTCBd?=
 =?us-ascii?Q?Jt2HW7GPbd5b4XxOtT2f0luDIomtr0xANJ1EZPAvw2018IlF5MIsZs5Wa3hE?=
 =?us-ascii?Q?yU6vXuxziUrLZiVHpr41TtPZrcNJZjgNPw+c8NWLYOPZDf2WhlgATe2uxBbO?=
 =?us-ascii?Q?PNjyC0zaV5AgjcdwPA2hoWPY5tJcZKYTBRWxGs33vhuh0EIonp510XGvkSjg?=
 =?us-ascii?Q?gNiri6JdGdddF1uF2Rl1EZWm//PcvoGI/TAWhGWzp09MBnBdxEhKYEtwt5kI?=
 =?us-ascii?Q?8Rbw3CLD7joVo3bLabna+oEeCstNhXi9/Eq0UGGcylDD0QqaBTeiiktxAk4/?=
 =?us-ascii?Q?rZ3UQQHGjtba6ULvbmjw/3sdwYDn/ZNuXP34DigyFHwhV9C49tBLJDIoaHji?=
 =?us-ascii?Q?SlE8fMlw0eOHzi9uCWh87yXWiQ5KXEaCd95RXQk6zqSiXoeDtJyL98l47HUI?=
 =?us-ascii?Q?rJ0ovMByk+YUK8NvtwZqSAj7AqMWV2PxeK0Q7OhDkVFFglq2btHcZdmBrnZ2?=
 =?us-ascii?Q?HK7kVJhwr1tdXa7dgXXzgVmTtYqy0GTShristLy5wXW3tTWJQbjXbWCXbQFs?=
 =?us-ascii?Q?/Vhh/fttCOrPn4D0AbhvKeVPlcQH3S7X5l76bsY8ZC+Vuh8UYX/Y/PCXJJ7U?=
 =?us-ascii?Q?m7EzM0H7ZnFPZelmk0FrDMOKBeQu0ZFB18hiMhxrERvAUyfy5OieIWFUdUHP?=
 =?us-ascii?Q?DzUBnfIOpA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5170882e-ec67-4d6b-3227-08de65374135
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:52.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62AxOG31UiZvbL0U/A3c8PW24lgS9NB9zuPNmvLC1+qOSmTFAMNDmGOOaB7leLmJ4ZzCBFIIe8wDmt+gdUTRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Add the data structures for FSP Chain of Trust communication. These
include the FMC signature container (hash, public key, signature) and
the NVDM payload structures for sending COT messages and receiving
responses.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 77ec44daa58b..8d49d844a372 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -140,6 +140,82 @@ unsafe impl AsBytes for GspFmcBootParams {}
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
2.53.0

