Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27333E1208;
	Tue, 31 Mar 2026 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774959803; cv=fail; b=NBFCAvwLlxDQkROevZ0p9bv9CuKj/9AaFGZyzI2LyBFWJ/S4v7TZbsdGmp0NPuWZNHAlQP4o/oRFVwEg5raAg+VcIimHANAHBIbsoq1axiap7wmK56ykCKC0HLNjBNdyO2AZqPed0GVH+UObL/ZS2ijvOSootCsiClyQAU90uYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774959803; c=relaxed/simple;
	bh=0M6Zi2dvhFuWPGnAT4yOuMYdN+LC/vsHmN+54P8R+O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MIMMkt0diNL763myrb+dYoGhCx4wcR08Ov8SQo853ru880q7odv/DcPdX9X7DiDMEvsq3CThvQzD4oxsamETGtQxedlFcf3FTQaFgVCNT+PEccQ78UZpMGhW4Au1QRSg2qB1jwHMN1RdTW4k7uDgAJDV2WsSh1U9cQRlAW0bwMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zfy5+86+; arc=fail smtp.client-ip=52.101.56.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zfy5+86+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTJV9AVT9+Yc86BkoVzkfTdJ5/IXtzyI/bTvbyHiL9cvzJn9hhvjbkwxOkRfe3ifqAnPzv8LgbjTRkjBz+2GznVupqh92ScKmnm8n2qEewmHk/l2yySLKNjHRdssI21IapBZzHBMSTPvR3jzPRWO0U1oqSPrTeL1ZOJswbKK4yi2rHax/EzTzHO4t5Ur+EDsH96EkxCsX2waEZu5gXqKSA1Nm0zx+NLcDNmSsgPu6JVlGq2VYBUOBRDFt+BsVGJ4WOjWFF1aYI7YOtKAp5bhvZf4M+mWnCM5KMku+yfy1SCX6VLvhCgVu+WmBOzKNIKzYx2cVHRGIkvLtvdb8vxhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiuTSA+MeIqXc3n2LKbtBNlNN/dLj9CxkMJQsDGlku8=;
 b=ElCgzZEmtzZbxT6lrPk3uQmFqan2rDZNzmFV6EI1j7UmeDkgdKri9PsQodXQ1889U1UM/LhNP6NbOYJQIqE9sunQDkvpnR0LECg3RlXUDBZyDwMzcy/nG+HlkYWygxW57bGLW4Hq56RmSm292Bgc+vCbTioX8k6P5aekQgTyXkTMvPl0oka0xTWqehN/T77xAPeJBdCP4mMXseM9l36yoi7IWHvvoB4zU+dZOligQe/X9WWywsJRYHQj7E0ns5VM2HO6Uu3pLXHr7kngciquiDuN9dB7mo9hhEd7gLqDtsXASmog2qV+qODxmbQhV3Ny9WxsHychaNHsEfB0/TOVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiuTSA+MeIqXc3n2LKbtBNlNN/dLj9CxkMJQsDGlku8=;
 b=Zfy5+86+9hK4S/peoTgQYQBS2y6iVmrjmRj0Zgo4TInd0tXGzhzr+ecb0TbIAMEWJ2nD+QvaoF8uY3O9c7jw+ORYWol0lk4SMJDp5O/mJEkS+kZ6rkVzm1Sv8GXzJ+V6jVqlFtbZJrNhToVjQVQtdJdMf9TGFmTduPPylDwIywVYNKFSkJLl+IZ0Dv53Xx9KMQOfYLRMvjLFhyq3uBIIepGQ5znLBDlY34h1mbwjQHFoLS3TdjPiys+H0lHS3uEBySf58DnEKa458O/dZB9bRkqhwW05q3M1s6ZDeTdT1j6WdpC1LIGgFQkb9bnOdfgutRbQzbaEAGev7fQhhdfSGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 12:23:17 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 12:23:17 +0000
Date: Tue, 31 Mar 2026 09:23:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dakr@kernel.org, aliceryhl@google.com, bhelgaas@google.com,
	kwilczynski@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, markus.probst@posteo.de,
	helgaas@kernel.org, cjia@nvidia.com, smitra@nvidia.com,
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
	targupta@nvidia.com, acourbot@nvidia.com, jhubbard@nvidia.com,
	zhiwang@kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH 2/2] gpu: nova-core: add fwctl driver for firmware
 control interface
Message-ID: <20260331122316.GX310919@nvidia.com>
References: <20260305190936.398590-1-zhiw@nvidia.com>
 <20260305190936.398590-3-zhiw@nvidia.com>
 <20260330125839.GL310919@nvidia.com>
 <983c6463-3c42-4915-b015-7a56c4f38615@nvidia.com>
 <20260330181832.GV310919@nvidia.com>
 <DHGCPLMB2J2T.1Y0V6KQUKVGPJ@garyguo.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHGCPLMB2J2T.1Y0V6KQUKVGPJ@garyguo.net>
X-ClientProxiedBy: MN2PR01CA0054.prod.exchangelabs.com (2603:10b6:208:23f::23)
 To LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6481bc67-f5a7-4da2-d6f7-08de8f20499d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FdnYBrATaGZS3q+MLpF191g5zKky8c+B/n8Xgp9rgagr3czXr8KUVoIlIgwBZAV6Q9CtjCDevMDsXwGtvIBq7zQ+DqKT+gXBgRcipyf5Lv95hB+QfToeCrfsWz0g/w+R/23xfGhEuu+3Vx7r30xIizjdoc6cgC6GUIP5vfKoNICRmyubozImDiLdhXht9TANiA8gKE0fQ/VnJCK45kb3p33un9IQFlBBqYI1J4koE72BNQ0Z3t5Uu5AEG3wOMjPlC2tEssOXxapEjCOt3HpEda7dzbsGg48p2l6OLtOVqMWAiqRT6O3Pa7vTkEaXtWPvlQqCjOUDPpgnwH5jJePF61yk0fCmElWjo611LKeiTojHF7UDdS7BZSjbKuvGP8pXXWpreFjzEi4bPuKYLz2uqp7Dd8Rq72xMg0o4EXKsIZphDIwzJrmpoafMen3AId88OgmQTfB7kB3VEtH4lqYr4nM5Kk0B6OSYv+tGxftoSJhoSNkoR2/m0Fb5aKzPctUbtoJh/zS7WBU78AU7AfAGRvEhT0HHCIVZO6MgrLluQDWTgftHVneOKJUo6y1NfTF5XpHwHJbld1fuz7ugKsCXJURQ5oHadu2sEP+OCAw8gRP0ipRPzZyfEpv+eEiZubvjGy8b2o3xGVZ6EpjK9HPzgKjhyv9RupGCM2n/x3K2/5WRnU0Mja3DoJkW1cBTyy35vZIY4j9gmAWw9+mGesCGaRP1atyPFIYOurCxWp620CU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GPm1gDNMxYAIA9jymodSvv4UPk7dVmmlAybulxJSzfGAwkR3xbBUg15tJaja?=
 =?us-ascii?Q?7NKxItDT0DqopawPN8tMmrvssY1JYBmZ2mnVapEQrbci8sDQXwULWqputpMv?=
 =?us-ascii?Q?qBg3Ze4D/wfHAlZM6HVyntD9aQLo/DHn5PaRId53gjnkNB6l0BtFAvw5Rfny?=
 =?us-ascii?Q?qb6yuN3vI9sGBQxw5KorKJINzbrQikS4WENDq7oEHqVTuaDyqa2yC9kaR29C?=
 =?us-ascii?Q?aD1uzrOKiZJGb15FiSlt1KCX97AFDBqq56/WnNuq6g0v0vjQG+sKuXhu5abM?=
 =?us-ascii?Q?QBCBP2KNncTgCIbXLs4QT2ALmIX9sS1JnINq1JQVFmWkXhlc7oQ8pJPpCs/S?=
 =?us-ascii?Q?VOs0X/pi4VnSzpYx67mUGKhUdX9qBNM8iMb2YR0Fbh3cijYCwRas0b6VKgwl?=
 =?us-ascii?Q?tsBB63FvX2aCas4GEW3fLPiWv4ciGWK4LbmQojPXGbV0lk16ueE0rMNqeOBC?=
 =?us-ascii?Q?f1gbiLcr3u/HdllHPiN4vv+v8vHIAvJhl40iipGrHh3nAQ9puCHiQVJ4bogd?=
 =?us-ascii?Q?hS2Q3MKvtFhNR1c5OUHDDhZeciqoGGhx8HGHc89aQ36CeeDCLqW0Y+2CDoNq?=
 =?us-ascii?Q?qHZ1Tfwdc4jgQMbDJGZRySQCScWo+in33N1euSxyDdwyZerRryRcLrML1hCm?=
 =?us-ascii?Q?RT+uPfzlnK2wi7qlt7r2T8hEwuyDE2S66Mf1YivQ2mX+HZJM4+1oqyEo+pek?=
 =?us-ascii?Q?GhabXCh15zuQTppPjODuiKCpM0TTNMizKqTrdmzHnrpt/ch2wfIg+TXdQbpr?=
 =?us-ascii?Q?MR16m0//I4T88gaOOOzN6QH1sZuYDoNWR2B6gc0gIcGhF1y9s24XuP+ApCsB?=
 =?us-ascii?Q?Z+mc0ugPt0iRswHXuTptA/bhE+IwVstgR1dmVls3dk5WfR1J+aBCMN2vB7Er?=
 =?us-ascii?Q?RAylpfyLvK6jlIkbZyWReh4P3xq17VqP14mjiwwO8kghxNDq9vdhld20HJN0?=
 =?us-ascii?Q?MCXyIavXZOXMB2N0iYjuQO6LW/nOhEzy6BAj/DWx2bH7bPtGCllXxLgNklcy?=
 =?us-ascii?Q?VDXoCtJ8yBv9GMTlXz3VhWnJcMEPrAhiBmRoHwapNjCJsbr3s1EqovfSgFYz?=
 =?us-ascii?Q?eXdWopdcL1fMMwPgnq9u+rF9eHSQogdLWvLod8dT9jYnBwylo1dWB5ua93AM?=
 =?us-ascii?Q?8m6YeY2UVIMKrcyrj4rKJlOJXmnzgaBJMQc8N5DWbS482VtJwPXVpAYWyOE8?=
 =?us-ascii?Q?8LnLGynK4fGafYVjE+bg2yKSPt54E3dk5V3mKYr+E+PUIWA55HLJuuQ7xqjx?=
 =?us-ascii?Q?XJ/ldZJLsvyiYddcSqfXWVhSZ3ZCMSy0T/4yh3NSnQrqfzYBp5/bGJ2bLJD6?=
 =?us-ascii?Q?KC2veakvHPgKMGVO4vp4CaJ6VEXTiddwT7ZeQC9hn5aUYkiQfSb+e5x7tNie?=
 =?us-ascii?Q?UlKYgyp9X5aPTKjq2pmjzD31ENCxsJcYy2btzffiSYV/5cTFPVozMF5f+STp?=
 =?us-ascii?Q?ac/PGA1z7+zfJeUHQiFL8etvF+jrzHj4WDLMYZbOUj0vt7+QsJ8rHi3DMCaz?=
 =?us-ascii?Q?Vtld+y45efFtHU7ZMmDZuq5Y3ySn4yujke7ODwxLISlTgGW5OwaIgz3VVi/5?=
 =?us-ascii?Q?oIHiSlKGAiFenxeG9bvnVU/Us2F8UyNmVkuckio/oIqeVzmyTZ4xAUiVX+zo?=
 =?us-ascii?Q?2yOyg/CGaQo7ClzgDZrwGyIiT0lRd10xUMoE0DxvGCqc43r8oZwkWHRRDV2J?=
 =?us-ascii?Q?eNcLxsEzaRgzL40s3Sl2QkjIKFPpGm6e5ph0moTVU1qtMyb2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6481bc67-f5a7-4da2-d6f7-08de8f20499d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 12:23:17.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHzVapOqgVNLPCXvTHcOYT/RIFBmYkfqSx72kNAutPZdN8lTi+h+yk0va3GE54hX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751

On Mon, Mar 30, 2026 at 08:07:42PM +0100, Gary Guo wrote:
> On Mon Mar 30, 2026 at 7:18 PM BST, Jason Gunthorpe wrote:
> > On Mon, Mar 30, 2026 at 01:42:07PM -0400, Joel Fernandes wrote:
> >
> >> Just trying to confirm my understanding: Doesn't that mean
> >> NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE becomes a part of UAPI
> >> then?
> >
> > Yes.
> 
> I think it is probably undesirable for nova-core to expose GSP firmware detail
> to userspace directly.

Why? That is the whole point of this mechanism to remove kernel
involvement in the communication channel.

GSP firmware is supposed to commit to a stable ABI for anything
enabled for fwctl.

> > If you use fwctl it should be as I described, it is not an generic
> > interface to send SW command to the kernel, the commands have to be
> > delivered to FW.
> 
> If fwctl isn't designed to provide abstraction layer between userspace/FW and is
> for raw access only, then an alternative mechanism should be used instead.

Why?

The purpose here is to upload a chunk of data to the FW. That is what
fwctl does.

> > This series adds a fwctl driver to nova-core, enabling userspace to issue
> > firmware commands to the GSP through the standard fwctl ioctl
> > interface. E.g. uploading the vGPU type blobs and managing the vGPU
> > lifecycle, which is previously implemented in sysfs.
> 
> Zhi, is there a reason that sysfs is undesirable interface for this?

Please no, sysfs should not be abused for things like this.

Jason
