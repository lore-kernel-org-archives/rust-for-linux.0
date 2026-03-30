Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DC43939C1;
	Mon, 30 Mar 2026 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875530; cv=fail; b=gPZhr7ZNETEPxY/UffdW02Qs5z72tnvTGOA7P4wKNZsGmzw5BeQJO9hHlNOGuMDZrbBoNw/nJBMIPsbvA3xaZS9YF9r+ErEWZ4BooPzerWO3zfvtYx9jg+9o7Vn4NPlv0lZCf3EMWM8zq74b/Cwtcuogla5Xdey/YnVDjied4rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875530; c=relaxed/simple;
	bh=9qdxaj+4NdT7WhYVJd6HgmOafG4BdWeHpv3OYyFO3wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=efKG1emZORy5LJ+QmeyD7gUAW7KvzVUXiH3lJQBwSrh0aDaAlyeWcQ1pRXMa3iiC3WOyP6wWby1jz6p+GIrB4aAtwPc3xqcjPMR2OYzhbOjdmV/zdmj37k8C/2Vf50SVfHbuco+QZ2JeIwpOT3zqhWR+8tqck6S2eiPhVctqPCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hxez+pUR; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hxez+pUR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np+TcJdZibBEQ+BjCd6HGsICVx41yl5N7rL5x88tI9uPObBq/XOM9YMBXabBMG3Oy7QqThwnncOkSTks2iuITi0n60aVjZHn0mtLInP1cqm5XNr7+o8KCGNlcK3YGKEMe53vzIeYJJgKhuzlrPAkkSBzShfUdnp/4j6GzaHFM7GdjjThS2bJm9H/JOLogKaoNmmWat4Io80hZokNevCjt7DyKobTI+T5QXSK0kszPxml7RV8cZtLKUNQLaFQY9xEkaokPVLHaiDilWQqNCFWpA77gv+Q5J3MWkwFePiq6cC3Z2Pc1BSLS2VgLbuGEygs+fd1j8bXdlVrTzMH9gb+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uy6T/PdkgjElicP4j6Pp5WVJslOUZxGVuBdoTjqFnrQ=;
 b=G9tBLztdUljSd/uKUuidckBx9dycMqi3kRojn27/hk+eP54a8TjUoVv2Je3lra/NtR8Iy+bzs+FzSKg+eASYlpz17LemqzFuBX61rgdMLP3PSd7YthbuWcnoMfHHqhW4ubMHdMRaC8jE0eobutJM5sSly1WpmlzG4BgN9fJzBo20KHnWt3Bg2+RXwwu6576IqmfkJY58NjduXmz+y6JrSJHt6prsDL0ynaOtVvgSpld02Gch2i8JpaneV/W+G8KaGz46yELCchJxXcuFgbkDD3+ownRPRueZyz+Pl443sNh5wileZAQGX/hDgjiCFZ2Jze13HExgzlgv7bXxd+ojVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uy6T/PdkgjElicP4j6Pp5WVJslOUZxGVuBdoTjqFnrQ=;
 b=hxez+pURnu5jx2h70QRrhhgN/XxA68ZE70tTS0YlyVpj/4+NePQ9h5Z0OL3yJPUGcwGe9NjiUuhYPPb7qocYWC/P/Q9dXPbtSUNvcyh+H6Uz1pHSW8lj0lfxikIUJVI8THemUoGkoKf1PaMhQ2yZTRrwvQMju3KUYYLDluioxeqAF5pgwn5pPgwupcpzQKaH6As5MOp3FI66aKxKGGzO6CJ4SJlHfPtAmdvyuDcHO/CRFKPLWUdXNOGDC2fuXQNS1rIYiUHgxxu7sidBZBTx4uaORaLHtabg0YJHWRMLM3lTMRLt6qRpe40nNnVjRPPQAQ+Jh/BJsd22e5iUjXGH5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 12:58:41 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 12:58:41 +0000
Date: Mon, 30 Mar 2026 09:58:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	dakr@kernel.org, gary@garyguo.net, joelagnelf@nvidia.com,
	aliceryhl@google.com, bhelgaas@google.com, kwilczynski@kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org,
	cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com,
	aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
	acourbot@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH 2/2] gpu: nova-core: add fwctl driver for firmware
 control interface
Message-ID: <20260330125839.GL310919@nvidia.com>
References: <20260305190936.398590-1-zhiw@nvidia.com>
 <20260305190936.398590-3-zhiw@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305190936.398590-3-zhiw@nvidia.com>
X-ClientProxiedBy: MN2PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:208:23a::34) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 8136f7e8-135a-4fd8-cad8-08de8e5c1110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LdzdCVVuQ44NKy874HFwHzaj2kHzPc3m93GLTZJGUoo9ChFQ8GO5tHlsJhoiWmg5mSShW2mvPPhqzNUl9BthlfQK2EutjwoOFyG0ku5ugxKLPs7iy85Y4M9oHUqwSTKRqHh+1gh9OMHiNRIzeuc2rlu7jyIUk8h54EOonkdSfsTuVecf0XoMcPt3VjGHwMsdKSJCi0EAgWfceZyubnX5zAHqRGIkuAJcRVHFcEfT0hJr1qUxKERh55UgkRM5C8TBVvEu7ZM4NwKjJJE8jRGtS/MGxBdsO27wdzj9OAFYm44QxtU1HFx0a2UVclGJpT7ckjTBxCznfQ5VzPZ6zwbDkzpZ/N8nHCX7fLQ78k6laEDYrzGpQvE2XZUfdJ6zrlN39Sl22kJFUPR/hM8ksV5RhKdfr3DIXV9v9tq1VpxrXcPKzgg5PorDMOZyNWB5QfNsgt6m17z4M3VvITGe2oB+OLaGGCh6AkRr9+u+DhAZfy1Ll9Dme3R9az0fIRZJwKIv91lkbZ8lhFAppK6m4SlO9FOCtwTgzoLE6AyLL64oimcSGCan49x64MplxlmRere2H77C0zJZjAUTQ0yPuvgfrpMiRpV1bIjilmWo6SEQZTqq72enXXMtl9twyTZLUO8hDZZvcBYXVISwXHXW0qNqaHepLm+FWAIiGjVwoRs/dkMF5RCM8Y6dNXKTQRMWkzzHpwcIlOGlD8N8XfIOvR6AiSreejSgXRVWOsghb+oy0ek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wc2m9ohr5eoC1WA7tqGlkuKqPcrx66t0UdzzVHKDH+tg2gKrSYtdeLVsp7T4?=
 =?us-ascii?Q?tIWE1SrbYIbOCQ7DkfsszfYK5qusQ1koF7H2i2WbOtrMgzHhXyG0kGj6ybW2?=
 =?us-ascii?Q?cZGDCjYGFw9D0JZ2OxY5t2tabxoj9zhBixZA4PCmSqg3gMHcWKMuoGWsgtvJ?=
 =?us-ascii?Q?B/dq3KdDxVIximAMolwznnEB+5Z6RuMd5SRL3HgWhNg+a2JdSYFzHgVXnYVT?=
 =?us-ascii?Q?uzLs7m35RvYZKei4yCcegC/yTZHA8Wu+wTgeuJRO92RfvsIZUNNeUA3EmvaC?=
 =?us-ascii?Q?UN0dnNUDGKWixaYlByqdvPA3QculsIbwVpwynR31aIkWzdBeFlqB+nEpLGYf?=
 =?us-ascii?Q?gPP4lYsxgv7moiL3PcN74P3YPvr8ug/k1yet2l7+YCb2+f16ut+Sy0PN6Gah?=
 =?us-ascii?Q?dg9eT4+F8RKQXtufRILgcKXfCXBz2xyj0ad8BsJMaoXMWBxYh65D7ke3aUw3?=
 =?us-ascii?Q?ODo3l8x7ZKqdSPQXSBHSynq6RFDVpTqJaLgEqB4K9BgyBfdxrUxw4zdezYgP?=
 =?us-ascii?Q?K4P3UYcVokRwQGW7x5W1r8rp2BIAQl1VQjEYo4l1KGQ1EKFcQRcTc7pF+Xz9?=
 =?us-ascii?Q?j8bSpgx7ceT4Nt0mj7ANTJRc3ZwRc4CMwgrK/+b/ZKGDaB9vjw39Y5PHdacG?=
 =?us-ascii?Q?+UIXd7Y8pddBVfVDEFepR8QnnWJswgiyYgaTQdltuw16Wtui2gr2p9XhSUTa?=
 =?us-ascii?Q?q8GQ7laEIYae/x6y53Hbh5UXLbI1o/wCRYhYAs8WvRQV4GgWztfZLmhSArq2?=
 =?us-ascii?Q?0TL40Fvg0kFwMiHAfv/U7lTCHGGUC9P+bgzyRJU6N1+eTp0rqf1AhbLmw8QX?=
 =?us-ascii?Q?+e/nKGM7tU9nsZg2GtZ/jqQX2ZYrWgRqUCAudGKAam+DxZtIqpAG8f2zqzAY?=
 =?us-ascii?Q?LBRAEWB3iu+Rpj56HC0ziXj0hD0udMYRegZCXtJGHmAjOLm2kcZIi9Fd3vhp?=
 =?us-ascii?Q?StW8fgm/X5FxYwBkNoJ7J/hxFdZ8zVTAUouTi3sXcPLyauRxMNnZ04sHt34I?=
 =?us-ascii?Q?v6cpRAxCSFRU9hrMK3EFT4pg+rzY0H61ODWiVMcNMYAG0vqbsGqxkWljScql?=
 =?us-ascii?Q?DIcJBVz66jsMGy2z5OX930j0uCvYnWn3dMSYJbN3Mef7sK7H5p5ytTmgKS+6?=
 =?us-ascii?Q?or/7cbrDbwbrRE59YeH7436/zjtw79AAiiofUy+1Wp5YMcitMvekgfxzv0GR?=
 =?us-ascii?Q?ja4n5ndOck9uhRhH1l5ugAFzGuzwPA3hoZ47uQsRDB6tDRpHOKlnc3SOC0YN?=
 =?us-ascii?Q?jl4VeA5HgcDoD3RqqQzYpj5lMugj+D/6LvCXkbCodWbW3IqIIqM+B7koBxWM?=
 =?us-ascii?Q?JmsiGDuk7oZ+RbGsNHSHrnSO8hQPkCwe3SydlBQuTd7vn8ubj8Cg/B/2gEmE?=
 =?us-ascii?Q?dNVmNYMT38YCzinflvatojjK86C7U1ZSaC8Bc7J+ATo4FAftzDLO48eeL4GL?=
 =?us-ascii?Q?RXBEKXgXt8HQg41VJ/T31+0OftaewNmQfNIqJVNzCU1pWNcn/i0+FQZyo6nR?=
 =?us-ascii?Q?bLHR22Z5L8Q3pkfCFI/NzMW7bojU5ISXNzySW29l2mH5x4LuTtB+h2LsrUXA?=
 =?us-ascii?Q?BZZtrKNQVebp2smwgkyZm/AwyRpbVNRchZLmtfTsNwAl4TGRJBYT671nYCfI?=
 =?us-ascii?Q?yYt3VVhIavH2/J7NPa+wBKmBzxoSTBk1O7p+6Rn2r1iMamJRSt7Ws1DL8W9Q?=
 =?us-ascii?Q?BGnL38RE3UYJVIDzGg8EPax/frLk9i1d05r/yOZHNeNkKUVa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8136f7e8-135a-4fd8-cad8-08de8e5c1110
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:58:41.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3viFgdKTuw1JfCoYGEgEccyQUsDM9YEsZGmLYCB0xCEV4hQlCXnYaYX4g0rlUi4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343

On Thu, Mar 05, 2026 at 07:09:36PM +0000, Zhi Wang wrote:
> +        let rm_cmd = match cmd {
> +            uapi::fwctl_cmd_nova_core_FWCTL_CMD_NOVA_CORE_UPLOAD_VGPU_TYPE => {
> +                RmControlMsgFunction::VgpuMgrInternalPgpuAddVgpuType
> +            }
> +            _ => return Err(EINVAL),
> +        };

fwctl drivers should not be changing the commands as they flow
through, the idea is to put the raw command mailbox directly into the
FW, and only access control them. So userspace should be setting the
NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE constant directly
and it should be ABI stable.

> +/**
> + * struct fwctl_rpc_nova_core_request_hdr - ioctl(FWCTL_RPC) input header
> + * @cmd: Command identifier from &enum fwctl_cmd_nova_core.
> + * @mctp_header: MCTP transport header (packed u32).
> + * @nvdm_header: NVDM vendor-defined message header (packed u32).
> + *
> + * Placed at &struct fwctl_rpc.in with total length &struct fwctl_rpc.in_len.
> + * The access scope is specified through &struct fwctl_rpc.scope.
> + * Followed by command-specific input parameters.
> + */
> +struct fwctl_rpc_nova_core_request_hdr {
> +	__u32 mctp_header;
> +	__u32 nvdm_header;
> +	__u32 cmd;
> +};
> +
> +/**
> + * struct fwctl_rpc_nova_core_resp_hdr - ioctl(FWCTL_RPC) output header
> + * @mctp_header: MCTP transport header (packed u32).
> + * @nvdm_header: NVDM vendor-defined message header (packed u32).
> + *
> + * Placed at &struct fwctl_rpc.out with total length &struct fwctl_rpc.out_len.
> + * Followed by command-specific output parameters.
> + */
> +struct fwctl_rpc_nova_core_resp_hdr {
> +	__u32 mctp_header;
> +	__u32 nvdm_header;
> +};

I'm also confused what this is about, are these headers words from the
FW definition?

Jason
