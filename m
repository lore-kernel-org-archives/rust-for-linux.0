Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42F2FD7D3;
	Fri, 14 Aug 2026 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786747675; cv=fail; b=pIKJcjCrGzW7gXrI2vLM7Itgd06xz5sCR9ePFl/6fMnyVxejNPlkz0iQu6WUxhzgwHLDBVYatrrFBtCg68ZVUFDyDMbnduvGAQveyMwVCypp22eJ2uHhCtLIteNh91MjU8il+vkCm+7SSvHjrO4cgt/lf713UyDuUBVK6XC61nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786747675; c=relaxed/simple;
	bh=+ScCyqCZTF4Ba4zOYBjB1c6wG8FZUsnxejRefgTwpOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sgSVyvBE4kvu6gimBQxWRgA+EhMg/DFA3EWHfKaxj2PH2cGlMyrDXN9QToQS3kT1yTJz9TgT1XsiQSEgNndetSnFtLc52XopZY0PjV5OJtqOZtJCT5BtPyqPsjPfYlZzbZd3JdtYzBb6MptD/WaqkDIUHxIUw26ZyljYZVN/R/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZD0Zhu9Q; arc=fail smtp.client-ip=40.93.198.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZD0Zhu9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwgYqnOKAK1RHKPKtSh6l+DN4BttutAAr3XwaqvmG/6pgYDeT3fjEia9nuREMDoIdQQUksVl2jkpvjxk4RRbCtJ0hUmj/klFRDQIC4HUnsL1y3bxE9H0JR/R23icn9FGM7GXsZhig4C38LySTPWbzm0jAmxXZsNMmoW9ps97BE27npczWBGqbHXdwKJ7mjes37OmyYpdVuN7TG/8iaXrEYsiK/uVK3FOH4hkdTz7ou5AnxZZ1hErBFCdcPxwCW4twsDp9YvqdGj8v8v8GWaHdwHkjC75eJkWroXvQUhFJzs7/VtkNJKTslBT5xF1cKuDBTSGIQbdleUMmEzpg8Z2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhvVZA+9YEzXsTqxP82PWWhhQwbZ8zn0yau2JtWVEqE=;
 b=OKYbkajproxO3EIr120+8Cc7BppXMENOG2BhPD31MPGx3HkC5zI01bILg7IuSMj4/O1dHUbzkrlzpzchlenHzmfRN1iF+BHsj2A9+CqUVjWBK/Fua7lBo/xy2cJ6v5pQZyXbX4ZYl5+plwQY/bZAopHbNYCD3ntTfMrVxoRyrk/+NYnwhaXesZJ/Y/3Oky5Ujg2vpSBVjhjyNKD/D1mxqBcAmGngw2vjZyPAPtobfwJbC/UIFUkaiZXGuZSTK+WZIS1QssAJgLbE3x1gMzF3Aec2fFzvzIHS2E6Fo87MhxmCYIlu8yVFC7bmR3OoRizvtGVR2tczjU8+MZhyx5lfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhvVZA+9YEzXsTqxP82PWWhhQwbZ8zn0yau2JtWVEqE=;
 b=ZD0Zhu9QYdJ3BVtUVVHWGhkvNAkQFvJ4omG+luocAIaYz1Bqy4eYN75LG6BA1gIlkv6f2tb2beCHSOVZieXNBx/aorYWoqPlf/yUCxX2gEqMpkvZHQfH8TFtl89lN3PYIdqFiVUw3UoMgwmiVQdNrF6lkGBIjzgoXLw568bXJMbSQ7T6Fw/KUV+IT62jsj4lXbn4RiG+or4mzVZFcidicuFnHjKXsELFwR94zeScSpmdwArrBD8pxz5JBJ9Nbo7I+PWidfriLm5eVN7I8eQQ8FgEgL2ydFIc348U1G1LuwlxsSrhg1DeZOY4+Hdg7k6jP6AGXW++lArzN586SuRzUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH1PPFB21296325.namprd12.prod.outlook.com (2603:10b6:61f:fc00::620) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 22:47:47 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 22:47:47 +0000
Date: Fri, 14 Aug 2026 19:47:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dakr@kernel.org, dave.jiang@intel.com, saeedm@nvidia.com,
	jic23@kernel.org, gary@garyguo.net, joelagnelf@nvidia.com,
	aliceryhl@google.com, kwilczynski@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, cjia@nvidia.com, smitra@nvidia.com,
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
	targupta@nvidia.com, kjaju@nvidia.com, alkumar@nvidia.com,
	acourbot@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v8 1/1] rust: introduce abstractions for fwctl
Message-ID: <20260814224746.GF510472@nvidia.com>
References: <20260813152312.1311142-1-zhiw@nvidia.com>
 <20260813152312.1311142-2-zhiw@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813152312.1311142-2-zhiw@nvidia.com>
X-ClientProxiedBy: MN2PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:208:234::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH1PPFB21296325:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a75ffd2-e7cf-477f-5093-08defa560fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hG3AZl45352ctMYt04FydUJyD1S/TEbB4bNNq6Z/LVcT2daVZYzV7aipnrM/d/B//4SVLGtpkIwagR9zVcxIuA3rPR2UiyUHLdaj33Xjo9SEQvshiCzGIaD+6MaVwSucRi5wuqU7m79RQAQvuzwk6vPkUbt2+GGK7B1ERupVwdPxdYK/a0Qn8PM9QD8qEhk76y86HBoqqZzABqzaJtcUjWErlAayp6zPwLmY/LCfNgeFRqTpXUsc5s3rRqXN3/JwkTnxz8FELm7fYauNHCKUfXgWvYSx/UdwpNTBD1xnOoWh3lAIhWHawAEIE6ro/VlYmuCoNZVEiHVH5qSX8QZPVdR1DqGjYGCoilvnbF4sNY97v/Bb/Kkpg3GfWcHID50jon4PxPYjyUjMNSmxiH5/bQeYGwFdfpB4v7JhQwVulH6Ervj8WR1mJY3JYLabrUUG2DYePzFr75gI+SL2D0Vq1bJ89f0Jp3KBXEg2ZCVUP1GcpzDSnClBnLItUkgVjdW/RJ6NdpmQ+wXiHTwnq1AW70/bvhLHz7jxrw8uVM2loHwTv9VAxrxJIBkDl0vVft9na+ufDjD8x4S7z2Mmt2y2MpCasnYArr9eQal2eR5Lw3t13QP+XXk852RZz7lJDCyuSi7KQP6WFNdvGfOxaRtSXXcpPCyLaQ1YBcvneIm8HL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xknqc5F0EdqgQHGomTC7XMwFBVHcAt9UQAUaulSk4C6woWSXqIN+grNo1G1s?=
 =?us-ascii?Q?ltFuYpOaOLtUp8+aO3w9rGbzXJ+l6dKs+M00Rr6JFcQlmCiqchVbA6kGqUtJ?=
 =?us-ascii?Q?9zrktJMSOqrLPCpLjbzpyEzxB89CrOql7kBipSjhd2Q7bewnofuNF6ERMJ8Z?=
 =?us-ascii?Q?Z1u26lB0tRj6xTB3fx45qLWGVFIy0ofNTAiuP8KJaFlZHfOqRvjEw5wmE0rO?=
 =?us-ascii?Q?Dlm4ITebdCNbhbcaF2HhcWQBpieegOZbhpyAWWHUWwOWKImTnSkjfei3F7gl?=
 =?us-ascii?Q?rvDZkipU9o5Tfatu3Thlf08p+oXmcuJg0s/I2+01zgzCDb5EKojO0iW7SGie?=
 =?us-ascii?Q?r/+LlKZnIUyfCYFi1ykObuHX3twItFHcvAEhq4AqiAA+7wciLbruy8BLJ5Gq?=
 =?us-ascii?Q?GywEtH9t+WonqjVXHUAqV0mQCiXPVbUG2Ka0c+DegGt6bgYa0lvgKtAsDAbs?=
 =?us-ascii?Q?itN/KJcFEz/ngBX5KEIkmCiBHpX4MKge1rA3pK76afLCZpjARI3s3YRAWWX1?=
 =?us-ascii?Q?Aj74RQKL1vXDv4KQpxHmnrmRRYDbFQLCo+iYxA0rEIr0Q3/4330USBnJMmly?=
 =?us-ascii?Q?0iyJ444ZZ+K32e47kdv611SOabmwuH27clt3/eRMoRbq/EgBVkv2uVxa1SVv?=
 =?us-ascii?Q?yzY5AjJIltUssnFa6yuTOmQ6zlFvOHE50FfJ+SGjC4jA2FUtYCwXg1BL2TTY?=
 =?us-ascii?Q?00Mk6gKf3X4DxJ7UjePQ5gikjglQXQP6i9hCb2e60MDr+z2jmHHx+055/9OV?=
 =?us-ascii?Q?tFo7tgvenyGk4LSxqDRNeyFpN0bSY6tCdE9wW1lhQ5xU4Gb/sjFt6QjrJQfs?=
 =?us-ascii?Q?lTUR+tZfzJSbAXMYFA3swiyT/EJKEVNtrf1q2ogZTQN5PEsib7BjV/dtUjux?=
 =?us-ascii?Q?6nbk7gt5oV0y2BVmlGFam3VM7YZEAwHE2kVJfpq6tbkHDnLsYQweaJ3FQJRQ?=
 =?us-ascii?Q?t1JpOnyYOyChiFDTJXC/krQxp7Pck81aIkqiWeLDjnEoMRdlJPIuu1bg6tKW?=
 =?us-ascii?Q?Z4/siliO/s2nek9EfuwgQuXqx7LFg3z0zdPr0Ra7wZRLZLNyTaAw/Kbo+oQQ?=
 =?us-ascii?Q?0KEWcATi/8F3OwhYxDynBkukOot2JQHqofb8jcyZgS+Fk/wyvFb1wkq3JC1r?=
 =?us-ascii?Q?ObAZGgV14h1H+aIpmZZFrC1cQC4GOv4N3R5YFYnx4WugBzhA4Hno2D7jb7op?=
 =?us-ascii?Q?boZ9s7QnwpMwR9rY14lBUyC6hySGLJOJ5+TxjI8xyeAVOMbamq+yrLRRfRwA?=
 =?us-ascii?Q?yeUI7kAGqF9Lc2vqQU5PO21eJW3KySWT9GWdUd/Ghz4oE+ML4VsIvSST+OF9?=
 =?us-ascii?Q?VB1YfOmRD8cKd1NNH26suajxKsCyuDuxsiaxQLg9dfAjzgDMKptrkaWnklXT?=
 =?us-ascii?Q?IWzO5yVL/u6NV9aXGFhDubGJHF3K3LRk36+gMYqw6OwtLaaGdNpAKV/yaLOC?=
 =?us-ascii?Q?da82+3GAB7/rhZLPZHLCK81UJhCYBzypc6FkGLoo0QeWHtPlR+NQ5L5j861i?=
 =?us-ascii?Q?bBrZOcTbgHxwaOc0hbINumsxnENROdzX8ta4QBR1eYyhjabH7tiMZrM69TlP?=
 =?us-ascii?Q?uJTUpVEXMXKxh+ODaPAAuoFDw8d2Kny8OdQAjTf44uuNAiRnGLTTOBi/BkK8?=
 =?us-ascii?Q?A52Obfq4y/27F1I5EoU4/WpP4Z/em8//YXN+KA/05SqVrkfXvM3oG7B0j9J+?=
 =?us-ascii?Q?UTEmETvgCHHcddT+DoiHby2I5fbxOm0Q7Gd3isq32uRCCrwziAlVMZksq6WX?=
 =?us-ascii?Q?/nyXmlN7yA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a75ffd2-e7cf-477f-5093-08defa560fb2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 22:47:47.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGC8mQdhKelKBjKE+PRI0+NRiCXHRRkF0m4yviTYGz91XTmP8xYLqQV9aGLqvK4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFB21296325

On Thu, Aug 13, 2026 at 06:23:12PM +0300, Zhi Wang wrote:
> Introduce safe Rust wrappers around struct fwctl_device and
> struct fwctl_uctx. This lets Rust drivers register fwctl devices and
> implement firmware RPC callbacks through a typed trait interface.
> 
> The abstraction keeps lifetime and reference-count handling inside the
> wrapper, exposes pinned per-FD user contexts to drivers, and validates the
> layout assumptions required by the C fwctl allocation model. Allocation
> sizes are padded so the kmalloc-backed C allocations also satisfy Rust
> alignment requirements.
> 
> Registration owns driver private data with a lifetime tied to the bound
> parent device and verifies the parent identity before registration.
> Callbacks access that data through a higher-ranked closure, preventing its
> erased lifetime from escaping, while Device remains only the refcounted
> fwctl object. This avoids requiring Rust drop glue from the fwctl_device
> release path after unregister or module teardown.
> 
> RPC callbacks receive typed scope information, a mutable request/response
> buffer, and the userspace output-buffer size. Response pointer conversion,
> length validation, and raw output-length handling remain inside the
> abstraction.
> 
> Add the Rust sources to the FWCTL MAINTAINERS entry and add myself as the
> maintainer for the Rust abstractions.
> 
> Co-developed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  MAINTAINERS                     |   3 +
>  drivers/fwctl/Kconfig           |  12 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/fwctl.c            |  17 +
>  rust/helpers/helpers.c          |   3 +-
>  rust/kernel/fwctl.rs            | 593 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  7 files changed, 630 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/fwctl.c
>  create mode 100644 rust/kernel/fwctl.rs

Applied thanks, I was eventually able to get things here so it can
compile even.

Jason
