Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCCB37756A;
	Thu, 26 Feb 2026 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106417; cv=fail; b=W1Jf9lGj1CIdbMZWB9m+R8i3RPc4DKdmwJ9lKYkzq2ISdxy2qm6jNDyUJ2PJK9xt+RbmJ7Ii2ZkWKhTLu9cR5fnI3/B+J0rbMv2PeGBbJCdtPSFQwgHwyBMUpX84HWFuRuqej1+sw+kL0oRX8Vjc1y0BXo2HMBlCK+nR5uv2KBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106417; c=relaxed/simple;
	bh=L5vkGMHHPNKksYspTaVTpDf9h37kaRVD5IV72o6Zl+Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=H6AsZvj64TzcIYBMTyNk/FEfSa6ZUjSnFCJKt2j/W8RBfzsFPSvQyyAOTixNbw5DXQF7vY/IwhzM7JAeDZuZzN9OrHZt2tKw5/eUe9xGDuLZ9GoxuI0+Sb7ft96Y08FecGM9RHMB6R9pNKvsAvAnopwJ0++wSWqQiktP1WonQcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XTLYZDUB; arc=fail smtp.client-ip=52.101.56.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XTLYZDUB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oylgy9B5iKeA2HYeiy61Y8Eb7k8OoKgVpe/crX4gJ5KcvK5hdDIgdZ+R376eof0AIAQhHaKPy1zLfGTIke4z18zyqSRBB+4b+rb6VcnSXPeRSbFYCFIFuDa6tfy4XJQIKlvgCBZgZeGbRQ/Z2PcRJQstlzESWfpuRfif5f7UVSv5zY8IDAPSOfXoWl7nFITP2ysrtsw00YWWciyQaLEVyCWcxoFsDQoPsjhJi0/jTy1KiOaywo4QF/lGC8hcwIpUhmA18WNPE86quQRxLLQgVD+6ZixTe3XBdKlR3vlL55hJESo2YUbCBmqj2Ai4AT/2NwE/sguoaBHDcwM/mr6U/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjQGDCSzf2Bu7JwIGWt6B97K83ritkwX3qFRyQw4Sqs=;
 b=GybXCK3NHiSMoITwYbfjAnrcFH30WDqpzANVTjlSFvH61XmtUw6UxRYptKL6k2YH1to3C/23nBjAZgDlEfES+Tjw+FjA+kN37eimQKhH+NGy9mj9DGCRiTKz2uFUFKC1oNmfSSP63LDCC4W6F5l7Q5uURarHC1/hNqlrp7vAVsTLvx0LcZ/5XpvZDMVHpTkmLTIYJN90Yk7aKrGLuttAtAZhbA5UsufjhpWF6FIgAmoas0rIxUU4zy86wz0sHB33wm2yO/sr6nEIy4wlEXZECuMuZK/+7BqbvgmxpG1Rx1aAyljPCtBhxk1CkiwuH0phsjRbj5UqJxVd1d9WBWIuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjQGDCSzf2Bu7JwIGWt6B97K83ritkwX3qFRyQw4Sqs=;
 b=XTLYZDUBy89tJayTrWD6WAGQt29QSC6NCgupq/3dgwvKeXWsWJ/wBHlmYojfjtunFn+KsPaix4apxltJF+O51cWg4pZ4otPxZ2QE++mKEhhm32H0AAb/LHkqWjgbVg8b34GQyGIGyEwbH6iRIhyGmDozloeT2ycKg5m05Ep1n8GQ+Ggux66Uw9AZGIYfgItlkQgda2nwD+G4u9WSpkR7xjHVKeTsVRJ5+1IHW/ieYUUpPwEh1k9Qtrq9gvA/XY4Qf+BkjG3HemTnO4VNYBuzbVG9kzMNMxfoz846ZkxtTWKmb0HtNhH5ZLOAzzdhf8HEjihU+atuussrR3/ipOFYQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:46:52 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:46:52 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:35 +0900
Subject: [PATCH v3 3/9] rust: add EMSGSIZE error code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-3-572ab9916766@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 772cd3bc-94a4-4dc0-9b9d-08de752cbbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	yhvCbRyr96xXPTq7fVE4QDOPTV83SAsbvpJPusdsHtMEgjtmUmlRGSwqQeHqQmPK6wKjkX43X7qPtSNpu2YrmTtvRS+87L148XVOMfJHjYYaASe7ZChbAAKm7PbI7cWOEa8DoajbmIIVKw+Ki/CQXHYrG9AZbn8AsUP7QE//RwElyMH0iUVngW2mocsB+2D+a6wauAM7vhwaarJ5EMMALjrdQvOD+CYDQK2aRaqUm7gvAlpEyJal5hdgAEeeisVdsopnfRUmcfFrcQ7CL2Qc1v/BmV+kngER2tG47eopj9JgMsvhZZfv/Cb5nErnwb6QYJd1vjTJA8VRoFskvCnp79js1FoRPir0/bYoh/CW/BaTZTGp6ukVh7o7rCE1Sk2WTy2WyhVVca+AK9568PdQqjrHJjFLNynpkvzoi68r/8cjxav9BhjMz6NXOynQNDquffIbkwrHKDPKiNXS+YunddF6T6SHvO5ZsSTVC+5jj7OyV1lqgeCL9pYb4Ul/Vg6MAXfPR0M25dvqCu4ssvvNsiXfEdiJ9wUhNad1imLMdthP7PmfwZRRQIdaTT/kBgAAwLB/Y61UmH2MLJFPpXP8nAMNopWKlaZlq/O3g+vN+o8o+QR4c6E0c2l+G8oZqb3OSJBddlZKeeJHiaYrv60pU3V2wb3BeM+z5KV3SJxLcioBQSIppNJsn5Q8VwYgADbZloXwyOEf5ktNllEpj6pckAK9eRSXNxp4I9ho1i8MaYpjETqbOW8OAXzd8Rg6Rj92AJx51Di75Kn4YaQ+Oea/HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHFlVko1UjllV0d5MElQQmJUM2JjeCs1bk8wUEd1Z2h1U0Q5WUYrbTRVb1NM?=
 =?utf-8?B?Y1RjR1FFT0VMRk1xV0h1NnpROEMwdmgyNEhjT2VQK3QyVXFyVm9PbUs4VTVE?=
 =?utf-8?B?UG14NVhlY2RqSklTRDE1cWdvNWFkeGU5anViMWR3SDh0WGdzTVhObzcvQUdn?=
 =?utf-8?B?YWRsSzBmZkMwaDhFdXRKdFBndWtHSjBvRlIrSmtKRWJ1dnRtYWJqRW5yN25U?=
 =?utf-8?B?TlN0bkxJOEVwUmFKL3J3c0FEdktzckN6ZFlnR2FiN0JEdG9BOEwySElydkNT?=
 =?utf-8?B?dmxUT1B5YVhxM3l5Znl4RkR5SWdLNWtkS21rQ0hSODRWbFlHM0VTMVZUNUxp?=
 =?utf-8?B?ejY0MlVxUHdXMFFkTUNpVDNxcGlDYUFVb1ZhcElsUmUzekp2NUtvLzQyQ2hS?=
 =?utf-8?B?L2xPNWw1WC81RENsbUE4cCtTS21uc0NmTmpXbGNjaEJOQlE1d2JmVVZ1Rkt6?=
 =?utf-8?B?WGY0SFkreHFzSGdQb0dkYVErbEl3NkdzVGQ3TkRsZi9wNnRFV2YwcjUyR002?=
 =?utf-8?B?YXIxWUNuSXBiWGVjMlkrdFRpRVVaak5ZOUhtK0JYVEtsZE1Ea0RoY0ZHRURB?=
 =?utf-8?B?S05ObXBLMUVwVDJ3bXZyc1dJRVNickVmekRjM3V2Sm1Tei90YUVQbG1ya2p0?=
 =?utf-8?B?NEVuMFFid0t4bVJhVFkvb3ZpYjFkN0VkS0J6bVczaXI0WGF1MjN4MkMvM0VI?=
 =?utf-8?B?TlAyMUFhRTVkMERKYngvMDExV0V4WmtGVWp4RHVDVFI3QmduRVFrQnB1K1l3?=
 =?utf-8?B?YzhreXFma01Vdjl3bUFGMVcvcVpKNy9aRzlVai8zMkprM0FoVUlwZ0RTWDMz?=
 =?utf-8?B?TVhTdVdoM1ArZkc4cDZyeTg2U0YrQkxUTVp6d0JEaVRrNEZtNTFRNXNscFNE?=
 =?utf-8?B?bzZiZlJoMmRTS3RESE5JZjBLaHgyQldYTG84VGFtSVA4bTJJc3dMK09iRkJ3?=
 =?utf-8?B?K2dQMXpRUjJwK09qZXg5MmZidEhoV1dFZHlFK0xsWWhNSm0vS2JwOUlpMURT?=
 =?utf-8?B?UERnVlhFSTlzUnE4b1czTTRxR0VpWjVmanNvZXNQdHBUcEQvWjhxYTQrVXQ0?=
 =?utf-8?B?aTkrTzRwbkIzQk02Y0IxT3IyOTV0bURxM0pNcjBsMmtYaFdQSzZnakZJcGZO?=
 =?utf-8?B?MHFybUVwNE83eVRPMTBUQnZUL3VaTzhPRU51RFlhTjA0NkRhZ3Y4aGNzeEtn?=
 =?utf-8?B?cHFaME1sUjVFTy8xdHd1eldoK3hYMEFKdmR5cDF5WkpXK1BGVm9ZZmhMMXpT?=
 =?utf-8?B?MnA0VmtNRW9DL01sVjZZTlYzTlhZd2lJQjZYQi8wYnlzdjQ5KzUwYlVURm5W?=
 =?utf-8?B?UmpCVldkZG1hVWpJZ1ltK1kvL0xDMkZVSjFoL3VkMHpmN0lwRWNVOWFibk92?=
 =?utf-8?B?aG44aXM2ZUJMNjN3ZkYreUxxMXVaOFdYUWZFcHl0bVkvSnRZNHI3ZDB5QU9K?=
 =?utf-8?B?eVI5RFZLb1IxbUU1NXRDR0taVVg5NFRLQTBJcmhucVpucXpueGZTeDkvbmo4?=
 =?utf-8?B?disramdlMlBxMlBjMDgzbEVSZG1yMHhQbysxT0I1T1FMNUpYODRRempPSTNy?=
 =?utf-8?B?V0VwM1RBRUYrWWJlTURZVENPMkpNVjNzSVluSHgwalVzRGJERHo5ZWk4ZGVw?=
 =?utf-8?B?NU8xWnAzWWdNKzJxandLMHU2d2tzSEZUcGR1clFTbXNOaDVSU0lyNThHTVNN?=
 =?utf-8?B?L09wVGlVSkovR04zc3dDUS9adWJaa0VRNTV0ZUlOSDJhRWhEYmFCbVp6YzFu?=
 =?utf-8?B?ajVhT2NhYWZLdW1PUldJSUh5Qm8yY1VuREFIb3VEcVNoN0JWV3BoTXNldklH?=
 =?utf-8?B?UTc0N1ZIYk95QlJYRlNnUVlxZThJcC9kUVRLT3dHTFF4VS83NlczSkJ3aGMw?=
 =?utf-8?B?SHU5cHY0TXYvSUxFT3hEcjNnUkJPbXhwVTNuVWJvbzNFVnRBWnF3dzdsWWVO?=
 =?utf-8?B?eWtEd0VFckNyMWYxYVBFOGtENXB1WEkvT3EwWHd3TEMya1lKU1VtNlhudEpQ?=
 =?utf-8?B?dWlPUWFDTHNBWXRYNDFrKzFJajh6bGZLNkMxTzNFS3ZUaUdEMDlKTVlOREVG?=
 =?utf-8?B?TXpDUTl6NGxqTU9UWjFZRUg1R0FjUU9sdWNRdWFsSldxR3ptTVJNZzhZWmpL?=
 =?utf-8?B?KzhBZENFMWxJZHk0eDAyUE9QWEYwTEx2dFozOU13STVmY0hFSzBNSDhOczBX?=
 =?utf-8?B?MDhvSVJ6VUFyaUk4Ujd2ZCt0MXFSWXVmNTgwRTQrQ2VrbnpoWE9wQnV3TUN3?=
 =?utf-8?B?RnZBY3l4YkxnZGswMGdrQmM1L3RjdmFrY29LZVpLQU11bko5Yzh4b214OHlw?=
 =?utf-8?B?NVBlK2hxL1FqdUtkQ2tJeUZXbnJ5K0h0NFUyYnhwSzRkRyszSzI2VkV2YlFE?=
 =?utf-8?Q?BU+Mi8RLWmWulAH2ISoVcI1vWykLyGq4/YXsUXj4eYTPB?=
X-MS-Exchange-AntiSpam-MessageData-1: n3CuYLlk0cj2OA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772cd3bc-94a4-4dc0-9b9d-08de752cbbef
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:46:52.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyyfAMieOKcBHr/tpyvwv8hzDBQdFgTahysLzZLEI6S7K8XYtO+VSotR9Zl02q39C864ZI/0QKXzJ6GX9VqS1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112

Add the EMSGSIZE error code, which indicates that a message is too
long.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..10fcf1f0404d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -67,6 +67,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");

-- 
2.53.0

