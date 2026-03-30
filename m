Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09436EAA7;
	Mon, 30 Mar 2026 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894725; cv=fail; b=dw+z71Utl1ujZhwSNchtBbNFLqYT6NlxD01GDg0r2N58H5sCm+uvjPPjlT2AMTe11BR6mhfWkLyijWZaMOoLgjJlIT96VqZtW566ox+zlb1IJbXb6WSJR+BHS2krS9YoiEor1NpgMZSEGAXArJ7lhJ6iU+5fWdVAzbLNcyKPlyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894725; c=relaxed/simple;
	bh=eIWnkWSaRg26tmrpLwGHf0ArMvm3pX9W/QIU3jwHULE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mW5eEuI1v907gfQl5qZGVb8sWYD2XW1VMOZEvYq7jiGR3nN7WAxL6SB0CDiOk1zyqmHo5BfBF4iOkDruH+gaySaRpB77e7qfQIEVvCCjenxaa0Qqc4v3UZNOGsgdLaqWKCpOsMNOoiLpyPvxd5qdwobaa2i09s3phIKDwTqqJoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d4cEGc8Z; arc=fail smtp.client-ip=40.107.200.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d4cEGc8Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utIEAVBqIr9u2ZnAlCbxhd0eSrfDrTA4I/v3hDYXzVBXNaHABigG7W7usQqhqCSGERFsf/UO1Dj+9uz43tdNC4ufhEkqfo/H6UxPCEH+raxHlTd5sTa0OffMP+eLC2BYZ434k3c0eCRhaNf4IvdOlmxH40D8pFYwlHDwM2wyxvZyKH72NUcCcXFrHeSnr805BxuO275oh44OgHM9q5eWyv9GqcWEEOy68bsbjzkT9r0MKZatKMXrRS4ZJqpt600dH1Zx2jL6iltx7SiyLwVIgqYlD8lmEr8n1MGoquq8F+BiNYGiVM6o6pNXhZE786blKG5wTnVsV3hGjFPk2Cdmtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIWnkWSaRg26tmrpLwGHf0ArMvm3pX9W/QIU3jwHULE=;
 b=Sy87PQsgGPFNd0nw/hWIYviQkaKIW9S7l756SWK1AyWhHFvKDPOHLrsWXMipXTxt340xVCOHQEmtaT2aEPr6wKgBngBQefggQttO6uBcPeQpxadc6xfF4SOJkSXpKVB6slVVCZnE8AR000reBRRSrBsccJ0qJReS+cX0uFVX/ZiNkWy8MBuEpU7TA3k0fMxACy0cx5cHxq/BBHaNX8IUu7FRsA2BMQ9GQp2Na32aIpfn+PcYUs9rZic/sLCybzQn7Hq5+nCbKqVI+oQrC/AXQUTNEwABPgaR/1dFpI5F3tFCCrKgFu7RM7bKGXWOPcCUHo6OYKQmQeIZBSO2YkknEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIWnkWSaRg26tmrpLwGHf0ArMvm3pX9W/QIU3jwHULE=;
 b=d4cEGc8ZkafAkZk77kARcqlY0AfH3955uHDY2J3BL3OhFXrg+00hEMzBTrxuazJRPjRScaSpVHduYBrxXvYpYLlVydU+OLi3fdFoZe0149nBkclQbVnAscwPGv0A4BBKYN5nzgBT1icOUbg44kG1QF6BKkC3bTlyLGikAeO3S+IEqpwadnthWABQfKrDEjih7xDp3j73HjxwSGr+yu9eE9FDo711C+3zAh/tqC3i4vBUX4Zig1yDkU6kSVmd08vINakPiaId5B61tm2/WgcfhhCqeevRIQw2FWK3k3E/QFdcUtN1cWtdhHjJzu7hKcuuNZV9WwT+NLpScJaAjVHJEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 18:18:34 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 18:18:33 +0000
Date: Mon, 30 Mar 2026 15:18:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, dakr@kernel.org, gary@garyguo.net,
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
Message-ID: <20260330181832.GV310919@nvidia.com>
References: <20260305190936.398590-1-zhiw@nvidia.com>
 <20260305190936.398590-3-zhiw@nvidia.com>
 <20260330125839.GL310919@nvidia.com>
 <983c6463-3c42-4915-b015-7a56c4f38615@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <983c6463-3c42-4915-b015-7a56c4f38615@nvidia.com>
X-ClientProxiedBy: MN2PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:208:a8::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9e719e-e311-4004-9fce-08de8e88c0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+Q+IYo5TFaf/h2gBU2U4RGROm71R2qIYoh5++lz7KzNsbNpXaq7v+2BgoKO8ApuJ4/4a+8BH1x2FRJfVjp/N6AZCT0bj2s0NNPO8gtoN1QXoD5KxU7CCaoBwqP9VzCOOY+gZ5xpbpZrrSk6QvBHAkOkp7qre5QIPMzwAlOUlBPEuYrLTk0yML6fI0PPzkjfLmv69G6jH9LOXiDWqJrttJS7jPyAXjmjvoRqBt61bJrbUufHvs+PZDauXXJtayVy3Rh+J9TnspRrXFI3XtYSk6o/BKw/tesQq2cEntAXepGZsJ2MVFKrMBYoNwWPzIoeO6ErAcjJkcllbvfhjwmgayZDdnjeZC5q1SlH7YBX8MQuznAhurPU+fkrW4W/LhI7jZHYchXRCGrZ4OBZpAHsOcv6meOCCvDE8LD+qquBtqwIf52BfmrgTn4QRnzfhT40KKlTA/qsoMSUJCvQBTZvxAMbHNpDzSDRsO5B4F2o8uIdKfSIpHHCzFEiCVHOJeXE6KEK7dC5gUukpNq5VDYt/Q1LTaTcw+7soUm0kRaR9KuZ6QFyHRHsx/PxZWjkeiWREEjnYaxXnjkg37q/jKqSoZrkHWfYaqkKdqZJ/AmXXcpZtAI2YT+bNqaSjIf410Jl6nKCWnYzEFVdiBu/55ERvOmaKGxp4aPXi5mHZ6ox8z8ySgg1HAe+tsv7y4iPUyxYg9Sa4ARLEAaCbcKREJduPCi7utZpB6maV/8mmuqZOW9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wLXEgtK8N360/9q3aaTm19BVt6mLbmCGa8n/3ujMo1i6nk8LjX0pfbYk2ruo?=
 =?us-ascii?Q?0d/sdf3+PZQKngFQdYugYiBfF0lthNwRAzU2gMM8Woeb71fyw2a5XqnDA1Ux?=
 =?us-ascii?Q?olSe5SXALxKKuYQ+at0kVPsNtK4o2XVZevMrTa7i5p9LOtYeTeUkAWP5EFl8?=
 =?us-ascii?Q?XtpHXAx1lmHtfRsNPnNH3InhCfNBQmBg1RPe2eSAaxLEMvqrryA/eL9TQH11?=
 =?us-ascii?Q?+SdyQFDeN7tGrbL01cAk6rVspVdMAoYEUmtZO6ReeylAeKxQ1Jcwzr11Ey6T?=
 =?us-ascii?Q?fG1pxwEHyTqrdqdhx4kPpQnKv5ojcBgw30XYgBq9uPVlmXXnBVFmdihr5oad?=
 =?us-ascii?Q?W3EVejhtEHBJO2cCL+F8KUjmpgMqritc94vKylmn0qmq6DSfZLN21A/2I3so?=
 =?us-ascii?Q?tZXDOUHdFpAb6vY4yHZJvqsGUha2ABxST6aIFdQgm4MZo4ux8Iz3zzJLF6Bp?=
 =?us-ascii?Q?zN8Y1Eiio/Q6G2pCivNgosi7O8s4LqS9zCgo28HvxzlI9qQ+MMMthQufAuMF?=
 =?us-ascii?Q?cKlzCXnGsbKTOC58cfnkyfeug81ThiM9z0BCqSNIHbs8gdsALrNSEObCwBZO?=
 =?us-ascii?Q?Eldo5ch5LFcwjyurhGSh6Ac88YT5V+KsQGrDJuOh7G7XNjsIzIBrD9zgwmaL?=
 =?us-ascii?Q?cxAvtwM0b1gUNUDleoxMBsQbi6bGGqX6tUSW8aKWGSE3PoUnEGyhl2N1LTAm?=
 =?us-ascii?Q?m8lFikWtvj34uFz8KzRwawEFxFdor6P6MUhqYhKOj5ESxFHDyQLYLZlLffSK?=
 =?us-ascii?Q?K6dt2KNv0R8RxbdwjS6Tk0BvRoexy6XBHQhYZZzc92YYU1R3uN1Ld03J7eyE?=
 =?us-ascii?Q?uYtyafP/Zjy45IVE07+3mwGeF7F9lylguHBpEX9ED074uNaLUPbFsJzjoo1k?=
 =?us-ascii?Q?3OIZ0zmbwplCiGhAL3Yb6h151fBM6ZsmEo3cToCO3LCdxdtC2xoQmIJEOx+C?=
 =?us-ascii?Q?kJnVXcMciwiAm4HN6XUVjVm3iLl7UCiP77Z91CjigVmzhAVGV8xMp/Vb7A5b?=
 =?us-ascii?Q?bmK1orncb7PQH99fY7nrGLs9qACpBGQ/SLSki+D1+16mYnia1BuIreRgz2Cv?=
 =?us-ascii?Q?7oiVp8pZvJVh6Gv7JYElAHHNLEwPBjeFMLsGXsIAUsYnUrfNsbqxqrGVQuPV?=
 =?us-ascii?Q?xH9mLWeDcRK6v67Rr0NIr/ww96KLy5R6BQ/qSWi9yQAY7sAR3Ora0H0vwXSI?=
 =?us-ascii?Q?+HX1uK0IvwVp9NBR8Pcfo+UrXEHu4FnwmHuiiUyhMsibEGO01HXSaelcntQG?=
 =?us-ascii?Q?bbXAlJ6gn8mLiV1DlAEebgtiJr9WGJHYhRTq5kXiEeery0Axj+awg7JBqzLj?=
 =?us-ascii?Q?6ZzD/7v1XpydReSrYki86H/WVmIHmequ1Hdetodr8wW5auCDBEAEm0aKlQs4?=
 =?us-ascii?Q?YpTxq0DpCxbADZI6qxfRAybLhVTGkNrKUm3EgBexHPDWNsmMoMVq/6aclPD9?=
 =?us-ascii?Q?IexUkTG8T/0bCYuLDpAfddi2ILq3l3QCGcMHS+TM2hdeXuuoI638aus2dyMc?=
 =?us-ascii?Q?Z0gsWb2VERFr7/pAqHOZ5HPUCl9gIxxCeaQZ7I3Eu9C5wS0UOBdtooB3FISA?=
 =?us-ascii?Q?JM/kEE5kNINTVcOBTvlBRDF4dHmEo9IIij00/QF2UR6oDF5gibYGze35ZaZ2?=
 =?us-ascii?Q?PMf28yPh32KKG8Qid16D70CS3pCbAPuBJ90PkV++hzxGGG6my3cxsPC39X7D?=
 =?us-ascii?Q?jNjPEevWcYK+tOdOLOE2H+wNrhzz+CjhDeXtqRMY3qrS8P9H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9e719e-e311-4004-9fce-08de8e88c0e1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 18:18:33.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+RphsI7IzitiTTHhiTtBupYm+zsQ2n9TSPq/GnMQ+pE02jI3503DnEnFFvoSfjr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778

On Mon, Mar 30, 2026 at 01:42:07PM -0400, Joel Fernandes wrote:

> Just trying to confirm my understanding: Doesn't that mean
> NV2080_CTRL_CMD_VGPU_MGR_INTERNAL_PGPU_ADD_VGPU_TYPE becomes a part of UAPI
> then?

Yes.

> On the one hand, there is the argument that userspace should not
> deal with GSP-RM specific commands directly (lest they change in the
> future or get removed or whatever, and nova-core is the
> abstraction. On the other hand, I think idea behind fwctl is as
> Jason put it above. So which path is correct and makes sense for
> nova-core?

If you use fwctl it should be as I described, it is not an generic
interface to send SW command to the kernel, the commands have to be
delivered to FW.

> These are transport-layer headers for the GSP RPC message queue, MCTP provides
> packet framing (it is a standard protocol like networking protocols) and NVDM is
> NVIDIA specific header carried inside MCTP. IMO they are internal to the
> nova-core <-> GSP transport and should be filled in by the kernel driver, not
> exposed to userspace.

That makes more sense to me. I would expect only the actual payload to
be part of fwctl. Any transport details must be managed by the kernel.

Jason
