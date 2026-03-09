Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DFC340A62;
	Mon,  9 Mar 2026 21:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091376; cv=fail; b=PXaRu+Yb7eqCKyS7TTieiSX6zP3dI3+J/nUC5sv2Ej6DrrxJq4Uaari/Vhex38OyCstZO1Sri7o1m7HHA1cNxayhXO01BaWSwGhny+A6WZIJPU8KI2thjsrML0DXMWc0jR5Bn4oimHZvPjBjeEYy1wG3edA+GBuetD9XV/jEntE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091376; c=relaxed/simple;
	bh=MUenjNAid7aJbri6MeDiST6tckDXQswFVityy2XM37k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IKuKY86m41UVlFLsuJvxJ0ruvsAtl3HzvQSa17Qi++fSyZHvmDYRxi/W4hRrnqZgY/mUFqme79t7f9z6ztkwnDSPObxx7b7LQWNWigXxkIfgA2FkjQUTP0htUXcUfgV1QkURDqZjAL7dRYRqY/i9qkfrUUvG3i28jFvEmGzoxd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sqZseNZ+; arc=fail smtp.client-ip=40.107.200.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sqZseNZ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E50uNzLfO4jDjJ4htV+haedxJapK6MqtXNd9hoE4O0dneqdTVIehU+Lo30kAt7Eotk65L1oN0xb4Q6k9v0bmx1vpOKXh0EC8i8HM+oJbKvwQ/CH3SuEH9+FfymG/DBIn8UhKHMYFWMejGDfkTuPENAJ3eZ8+QAIXy8qeZesek57LnFmwX/PcbptXPny1p4B95Ot8h0O6hYl7eZT9XpMvlGXweiYRQJ/3uQGhVAm2jKhv5I/uC6k0RofgaLbsaX+P8PA63+bVvENIklVEF/IMnUDpq0fELVpHhWEV2c+JwDYylnHSFDin93sdkZ4UtqUhs+98vpXZYCLGVBQoxYpzxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE4bKCSZ6trp5wIgmUV3K6swmheaI1s9VmQuwL1Bk5o=;
 b=P/acNTmAqDX8kYkPNCRu4i1AZkU0oSjz2sNRG8tO2ENjmui/m3DAL7eMRxiO5a3tluWvjPlsTro9oWLxmTDAvWGgy3ItgS99aDZHuolyT8cq7kE+uzifXLW4iKL2xh/UH4s6m5NNnad+NbnpAi1PUU9dWkB3fVJXKKNzOkVRz1NBBFuwj9pIwkUT6upHgyIElLoqO46IwFStsIiyp2phcBclVyZZIlahPrmOn+2sG3fbxpePpMC+U1oG7+kgvt2bAw3izqRfL71984EcdjupkrmeKfvsZHxvti0R2Pe/aPCcl3PNT5PPC/tpqPg5I/UeXiqMNiaWYNqlNMj/Of2yWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE4bKCSZ6trp5wIgmUV3K6swmheaI1s9VmQuwL1Bk5o=;
 b=sqZseNZ+iq2RgRcjQfM39ZzwGgriOSKs/HpovrOegEfRLIBUKPZC9PGmPWG5Gyl2swlZQNrZ9f7NTc66UIpcLWU3t1owHDKpwBEZYYtJZqhAR6NQpQknlkQrAMHd/0CUVgC1cIUhz2vJQduDKNSQJX++8H60THvXyGTovDol6MmGXCPQsmReSed6sH4nwKSnpEsNXFxCIlT360EkFLITE5KrEFfrn2i3NG+CVpG1xQ8xCAunJGtmQz1lX2bSbvWridTOlMqueDXB1U5l7BEIISUI4VJ6yMtUddTl+8kS8HhJmSyMvnB94rJIhAk2jMaqICn2/ceOVVpffBkpgl32lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 21:22:52 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 21:22:51 +0000
Date: Mon, 9 Mar 2026 17:22:49 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
Message-ID: <20260309212249.GA2889394@joelbox2>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-3-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-rmcontrol-v1-3-86648e4869f9@nvidia.com>
X-ClientProxiedBy: CY5PR15CA0248.namprd15.prod.outlook.com
 (2603:10b6:930:66::15) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 26000a92-4b52-410c-82e1-08de7e22052a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	cI9MXUedhJ+H6p8B2X/39jSvEU2Xxa1uYt73hh0pofbrQ0GGAfjCeBaU1rh9RAavgBJBo5EgfEaB8pGVS6f3OTfu4jc2Rbn7BTt11mwkjWomYLC39znhCaw8kfDQmOVICeIB2SgmUnrFTbor2FS0AnmPVBe1HPk3tqDm26BmBj3Cf9f1g7OHxKAR5vTZj1xX3UHKAb9t6MZZPxCihtTrMBowbO1/jAGNnwYCtmbfWIrSJzivtnVsDNDiKd+PEWFiUq1X4X6zFmvvW9OeEwSe/xN7cIanJb7MF3bqF+IY++clrV2EOKsBKwQaGouOe2z3XriJ8wUkSF54XwXc5TMV6va4vCh9uhs7vxyJ1+zvNWXcgI7YTMvctvpwK55aV0g99SfrtirRTFdbfsITKwmuZXKKl7AF4CHI1aG7FKcjIQ7Yw/TWGPpPaAmoxTgFgs04X2U9NEYcFpfy0mYP0knYs2nrOLVkx7BAcjIluq8LDNBxp2zSUDX6uuiN/C3Dh+M2mepwZwR92nGqtjSrNvdvyV6nOxg1KMSShnG0UJsjaap7SxtBOjGuLzcXwutK9HNI+uTNkV5TuAOIlIe0V7l08fsYZJHDIOafpAuV4nI06ma/4FN7vuDTJWT7roBcEUk6B/2DtVyvvPNd8qsjlS1Yrd6gM/Vyn+vWVrkdoAEpRjprjXLAa6p4BBFN3KSsCbFKRHYnZ6X3LKa4hgwVb/Mzu2dXRRNIEDgFEULIBhRuuXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NwdnIDy/egFJXKjEkDC1YbtVaHRs3xlfh43Eknl4A45QfTdoK9kh+SOQ2aQF?=
 =?us-ascii?Q?4I5UAGOsOkWyZCibRrNaXpAOO1HV35PH70Vlvru2V26hnvK2BLPTCGkePGHK?=
 =?us-ascii?Q?f3Yp50jlyi9B5TvK7EqYTQZhVFnFVeViHIJcevf09kuijt1y26BWEkWAIhMZ?=
 =?us-ascii?Q?AfodxVpKqF4RrPgMCMjKk6eRYst1hX+ISuIKqPZdD6NZv1stZzD+OX9NkzlW?=
 =?us-ascii?Q?Z8v1uc5hs3zb++36kVdTHnwfy4GCy0ZxDxv6ZYSrYxm81FD5J25+Aq0HDn4o?=
 =?us-ascii?Q?Y8qFAcSdmy89pp1HSwqyT83nmKLquBdKBt/elq5269KIeA9IRNFcMacCQtFb?=
 =?us-ascii?Q?xLxKvMiZrmJ47lsHUpd9hmFC19s+CHFZup6J3LH/ACINJxv5g6uu+LNJybOP?=
 =?us-ascii?Q?X+7uNmxntnI7fOY9yO4IjYWjOrX5EnSE/Z96fPSGQ2DAYQQefRT868YzBY61?=
 =?us-ascii?Q?06/iYuXZVZr54xGO3kRfvAr4M+Vfd9hgfI+ecX7T1YgLROEwGsxZfbY6qvZQ?=
 =?us-ascii?Q?kOHV+C5IvcMxmM/AWngCiqclrYS7RX1t6QHyO+A0xU7Fg7AxGqciyFKjxMRV?=
 =?us-ascii?Q?e0EdF6nUdA60JK+6ziJOGogwG20BpbkQUIcASSzSDDiQ46GS8RAmqR5vn8bw?=
 =?us-ascii?Q?U1vnb8a/pQWK/Sib0Zs8A585OjOnvkL6xYotb5FjP5W/+QxZKxELAxra88Nl?=
 =?us-ascii?Q?3c92K5mLlTL7GYWOg2bUjWpFWg5A1cE9T9+oFOlL7LeyX+afxZ6re5KYQe1K?=
 =?us-ascii?Q?vI451RofmtRFj1kH5TjF7pcDdJ5Uc4+AxYYSzYDXRE7viayraBHzHZy9mitv?=
 =?us-ascii?Q?BW6c83N8kqASIybTojDzWZS2QGRrhq7RiNDqxaOnDpqDntDwVRvgkx+OanHP?=
 =?us-ascii?Q?n4M1axITEuV0+RqwUsBc4heOLsaUwZYzDCymVE54xIfuny5LEKgwEMxkvCxU?=
 =?us-ascii?Q?00BMR/7OtrjQIp8hAmI+VgIUuLHUQArL+bwjSPwSAaFcf7QnCRzZBY7CTyPN?=
 =?us-ascii?Q?Wkw7VjYvelXnxYKFcXzg9K1Nz6EUyiVAPW8VI/Oj+VhsmU0uQnfBeYluUD4g?=
 =?us-ascii?Q?AIhdkoHPiEdPU7dWd0uwxHAcDyPWURzE0KsuXSxaqj2xcIo/IjVFK4nXRwN9?=
 =?us-ascii?Q?WgaOWKKJfSzyFd1kdb2VUSbDZjrcZkJw1E7a6BDCa7G3RJkmmVAXJIgFYGi4?=
 =?us-ascii?Q?jUTpZzmotG0PASxxi0SKLyBUWo/yEJb8u60AuBiGPm81Mma9w4JvI4Aipxco?=
 =?us-ascii?Q?4fP4EfQgLcwNDrNuu8UDq8j01LboyC2KZbsizXvqtuqTcVNHirc9beRFcddP?=
 =?us-ascii?Q?O8YY4bsizQ5HeE+9j5DXwPpmeWDORcU2cqllbRb4qCbkx00MgUfgjDXmXXGp?=
 =?us-ascii?Q?ZtyFsa0gweBNLCqcqzdyPQpLXHkCVzyJQOXjRJCRoK638l6oG6uATwHwNStc?=
 =?us-ascii?Q?PGE4IUYx747cnenDq/EoANmRzTXej/vdgw08ynKgsq7/vL7V8eQ5n4qmf5Q5?=
 =?us-ascii?Q?F6X1Oj4GnL1iBdzV4LyItKNBy/4utzyvbK0hnBvGr7B9wFN4cmnsetyRIBAV?=
 =?us-ascii?Q?XSGO+Khb3smTwk8yQJxJXmjbKs7FknjKcnUUHJOWH2ZLJ087XVSl42Toux4V?=
 =?us-ascii?Q?2Wvtq6ymp0tvNSJXUJTEEaJHYkU16JHjm5j9zIQE76qkatycgETOF1OCODBy?=
 =?us-ascii?Q?bv1BXaTMWQ/c6DLMYr9Hfdp2qk2/Co8Jo8QqDzpgRvjqCfW85d7QT/fZ1PRS?=
 =?us-ascii?Q?HKP+Ac6i7A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26000a92-4b52-410c-82e1-08de7e22052a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:22:51.5332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +F6hnLBuQW45F0iGQp+QwHL3tjqUHXgJUDBQf4e6BlyMjOmLNhF/kn7snHqYs0bUoz7Xftatb7R8ffDyWhXhFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570

On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
> Expose the `hInternalClient` and `hInternalSubdevice` handles. These are
> needed for RM control calls.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
> index 4740cda0b51c..2cadfcaf9a8a 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>  /// The reply from the GSP to the [`GetGspInfo`] command.
>  pub(crate) struct GetGspStaticInfoReply {
>      gpu_name: [u8; 64],
> +    h_client: u32,
> +    h_subdevice: u32,

I would rather have more descriptive names please. 'client_handle',
'subdevice_handle'. Also some explanation of what a client and a sub-device
mean somewhere in the comments or documentation would be nice.

>  }
>  
>  impl MessageFromGsp for GetGspStaticInfoReply {
> @@ -210,6 +212,8 @@ fn read(
>      ) -> Result<Self, Self::InitError> {
>          Ok(GetGspStaticInfoReply {
>              gpu_name: msg.gpu_name_str(),
> +            h_client: msg.h_internal_client(),
> +            h_subdevice: msg.h_internal_subdevice(),
>          })
>      }
>  }
> @@ -236,6 +240,18 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
>              .to_str()
>              .map_err(GpuNameError::InvalidUtf8)
>      }
> +
> +    /// Returns the internal client handle allocated by GSP-RM.
> +    #[expect(dead_code)]
> +    pub(crate) fn h_client(&self) -> u32 {
> +        self.h_client
> +    }
> +
> +    /// Returns the internal subdevice handle allocated by GSP-RM.
> +    #[expect(dead_code)]
> +    pub(crate) fn h_subdevice(&self) -> u32 {
> +        self.h_subdevice
> +    }

Same here.

>  }
>  
>  /// Send the [`GetGspInfo`] command and awaits for its reply.
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
> index 67f44421fcc3..aaf3509a0207 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -115,6 +115,16 @@ impl GspStaticConfigInfo {
>      pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
>          self.0.gpuNameString
>      }
> +
> +    /// Returns the internal client handle allocated by GSP-RM.
> +    pub(crate) fn h_internal_client(&self) -> u32 {
> +        self.0.hInternalClient

What is the difference between and internal handle and a non-internal one?

And again, descriptive function names.

> +    }
> +
> +    /// Returns the internal subdevice handle allocated by GSP-RM.
> +    pub(crate) fn h_internal_subdevice(&self) -> u32 {

Same here.

thanks,

--
Joel Fernandes

