Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB22C35C1A1;
	Fri, 13 Mar 2026 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419184; cv=fail; b=W2gjDmshJY86S0DEbb8uShw3gTP15TolOKlpSuxYnxvr2Lj2qllMWCLLYNLL0qpdYmAeFJaKyhag88zwNA43aoL7f3UDMsYMnWIpXm/RFy5Knhp20qK65nm0f9Ejk5EBf0HUNy7jWtRLsINM4fZfuBs77wCIRD+mCX5+sO7duq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419184; c=relaxed/simple;
	bh=5V04NUWy4qikxD6x78xqXd8VKyaopWdRK/Bl/cUgHAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u7fHqqFVhGAdiPPUVi8m5VSPUzdZPqDGvRxMeaSSCKfCH5hEcshOaPNXYFNgoEtJUcp5olXHvwEDAAyhA6JVv87maT4Rz3ZSZ+MXp/6rZjgEyT6J+zkFCPqELrQj1IOtA1pv8ALOL4SFOYPIaEcqLK8tVFgUu7kPeBdOkRCae3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TEKQ+qDU; arc=fail smtp.client-ip=52.101.57.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TEKQ+qDU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew/yw49Ju9mKnaIjA8VR4NiAvk7H4AgAPRSWcbvcUacK2AxKjdICMItfMZ29WHUIlBd8sjSAd161C9U1N/1q3OfiKSxMbzSCsif9LICj0kjDZaGrFO7+rn5HmO5jBKBnfpzyhOUom6T0Fp/ldGruRt0UZnUIcu7zvSoRlA/RC1Izi+uUSNQRLuZ/sJhNTAwfW3peSqU7Cd4Kn1Gvgq1cy4E8n/XG/Syzbw+utIBAMbKqdQyPpoSpvZk8D7kPrWWuBmIPp/IE6MzufSLWbAdiog33oJZYusjFt0A1efRGlho+wihYkoxb9qjXZgVfBzgWKPECsPTyPcUUfvzG3mA1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d6tL8Jhs5gWWyFMY3kcl7SeynV8GMjVfFo6GZQooYQ=;
 b=xuWuYmqoy6Ou23CSI7UF1GzbNh7Omr38yDwy726IMm9AY3+mtI3MVnGSMSVzV2XDZkZU/TyPS/HHGAHRezY26Bz0EZcUwKfdTaRjX9Eg642FJ9xgNuSfhd4RzyWnC8oSu7xFfRCgQjUi057GgRmV6YdW+5v9QeiALWK5KOrT99PX1M+Bmk9Cyej+ORD6B/HiF11/Jx2U/bpzprA13ZhcbEyN93cmvdpel9XmaMr1gWckM5o6A4Or0xB4siYtR916PtOS3vTSjmYEwoXL7tFT+oDbgsIcksW6NHLxTZtJ5QeH5LFF+7f+L9FyR5EnCniAQdqVGjeZ2A0RDc1/f7Bkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d6tL8Jhs5gWWyFMY3kcl7SeynV8GMjVfFo6GZQooYQ=;
 b=TEKQ+qDUrRMjHljALxr8mYGMSd7tWrgG7CrIEtMAVXL4H0EDUwU98cZNQ+LHKw3a2gWVN684T75Vrs5KCpTbjbzSV+Gn8PThEXMFnQ4yvJpf3uLIUAcXgM8SbUrNOAGix+PKHB/U8GsPMKHkh0v+BmwhomnR0wZ2OMdZ2/SqhhV+tnazqBJSquH1mbnBRbz0iwtOEZk5HNH/7bzj5L7fab+vKB1UY1ofm8vFiSXEMrdqdgCWkst8P7mzaLj1xD7f8vzfckNTa0lEa6OOfqO4Sm0L0jmmMUMcFyQJcZ1gzU1dFYkmspXX4nrTjsnWtLqryYmRP3tJL1yIYDSOwCUbwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA3PR12MB7997.namprd12.prod.outlook.com (2603:10b6:806:307::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 16:26:15 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 13 Mar 2026
 16:26:14 +0000
Date: Fri, 13 Mar 2026 13:26:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, gary@garyguo.net,
	joelagnelf@nvidia.com, aliceryhl@google.com, bhelgaas@google.com,
	kwilczynski@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, markus.probst@posteo.de,
	helgaas@kernel.org, cjia@nvidia.com, smitra@nvidia.com,
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
	targupta@nvidia.com, acourbot@nvidia.com, jhubbard@nvidia.com,
	zhiwang@kernel.org, daniel.almeida@collabora.com
Subject: Re: [PATCH 2/2] gpu: nova-core: add fwctl driver for firmware
 control interface
Message-ID: <20260313162613.GE1586734@nvidia.com>
References: <20260305190936.398590-1-zhiw@nvidia.com>
 <20260305190936.398590-3-zhiw@nvidia.com>
 <DH1S5A8YOFJZ.5D7A45BB4IAT@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH1S5A8YOFJZ.5D7A45BB4IAT@kernel.org>
X-ClientProxiedBy: BL1PR13CA0364.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA3PR12MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f5fef7-1806-43a8-7755-08de811d3ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bXFKKzLEWg5eQqfy/xPByUsg0IJHuJzckQ0TT/1HfPW3vtcpxDMp/vq321cIl37yctEZ1LtjaQnDbfP7hRzCRluBpD6WlK7TXOXwEFfLXMYa11Jvcdbe5gKfLQGUGeh4COlizV//QyN+rej7XQ/prgDJ2UiIZlUB6UjOGgDMRAjOTOd4Yyci2qnyfKG3B00+tc7A2To8szGiSlVAW2gwQAM7ba4bpxeRBJqmghHPTTyDKSpe8A7Zj0/VAJacMtlwqg6toIvqwsr+THPeRVz4KiFLC1aRiJfrYZk+WzsthGJYtVRNd/+mML1RYxYj1PLojK+doupFaycFOqBmfh2n+T+LnBC/oMHXTrYy3/uUqyp7Cwv5QFh/3kkedbLqZKmmdBbXJcw8kRe+cCDZ0i6TCJOB7xUnqmZmS96HMLFinDe6EkXqvMOC+v0r/rPTEBPe3M54O8kpU+ywGoLPK2PpB1ZyIA1iKCzuNX1K6c1zdIjxzX7JqBJBzwk8haY5FUwHaTPPwxi/QpfZTVNUNDvTDDK82C1WQJ6ll0v/NAnC/UJ+hHuJNIwW5s9jDRXxzkeDKCghAiq3Z1ktSzbfHBYosRaD+9VC7GzHLW5wrp5XqIdpTyqlxq0oMl/ZDWKV9sGuCyx1MRV5klUOEfKlU5CfT1wunX0/icfVuDvIKtui3oAmxKT54isZYFyO1O8FUrIHFduNbue5CKuTIbTUWx+7pcRd8NT7UjNzou/9VOnvshw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nxemm6gdXHaOcCGwjr9GIgUx83+xblb6gD1Z99lRuYyBYHottBnf0DdTA2zh?=
 =?us-ascii?Q?373HnTKaAJnspQAF3YgzDPBbmeqTt3Zf6Wd2Nm6C+Gq74J2qyUqUieAoaLmq?=
 =?us-ascii?Q?EtjnggWUxU0nxgyhyNjfinQrH7im1gdvfDO1ywvbnWpoCBKbRg+qltUobz/j?=
 =?us-ascii?Q?thRyYMMOzZKDhittmCrhkY1NiyI1HiFTBYsIowLuo1tEHmj5VD1ffxc/j3dQ?=
 =?us-ascii?Q?OOiiOQFapu3N0akIjR3X8QFMup5JkV1nCrJDXvOEegEEhIY2mUafD88bfKKz?=
 =?us-ascii?Q?4Zlx2RwKeQR/bEoe37mOu9WrX5+G6S1MhjDTChnc1HG/iN3BEBbVtIre5r/r?=
 =?us-ascii?Q?3b4QIErWSkaMpYpo5vvnuNIM3iLYvYSFBthbl8/lcvt585QZc/Es6kx8txU/?=
 =?us-ascii?Q?1v+vs9IPOZ6kfUpnczJmtUj42iBaxF+V3+fqKXaV7751aAxITX+u5RLuFf95?=
 =?us-ascii?Q?2jonpMK3vP2PoMTZX4LGkt5DNhvKHjlfAK6qqOnTsLVZJCe7877s0H9PSJIk?=
 =?us-ascii?Q?XejCl6abQcGKX9xvdsR86h9vHDNbY//o9rTMYTCClMDoItOipwS/4AzPsTtX?=
 =?us-ascii?Q?yRih+dH4mYBJUxRVffcw/OQ4ZyApwgCDYnBQmNaPVKvzRfmkrfTPYxX1NGPw?=
 =?us-ascii?Q?uSGYety9aBHUfrFnvQf6CjavZR5Ux7BFOLcz4qo3gr9dkkGligJ1b/VqZki4?=
 =?us-ascii?Q?tGnwk1vAk9GCNCt3Stbtn6eVJFftr6bNUtli70OmMsnFPVONoWMlOIKfYknG?=
 =?us-ascii?Q?MbSl3895eGOSeiqGrbuTNvV4gOjtRJ46DwXbKT23GN71BjWBuSV1ofKirapI?=
 =?us-ascii?Q?Oq92NfHEhaHejtHH3eDftw0z9lIGGe4xDAwHeSucQX3w2cwbi8rxO3Oyo/At?=
 =?us-ascii?Q?84QjAHUtImtOHNU/v1Gpy6SVSIYlZiwSQzgBlrc5HcCUnQAH2dTFKg6WgUzR?=
 =?us-ascii?Q?GAySMe/m1NwN1D/zlgF7PvGeLktPBt3GUe97s+YCC30kcM9nzVX3a/KA/TXD?=
 =?us-ascii?Q?8ZzClVcE+4P8Ebi0jNE1fMEx6ImSquMUmxVwpz2NRzfDRfMxClSQcNkdooDe?=
 =?us-ascii?Q?9rgqverJ722aOY2d3pF3u3r2e0V6i+P++/Ffn1+KiL+y6pEz0PDrlwGdQkUj?=
 =?us-ascii?Q?sktuhZIjOiEWOr3WMq6N7lBvfBKhPNSEYv0vc2G24VEGq2f9YljrhGBC+iKW?=
 =?us-ascii?Q?rVkQQFPGVnqAroOaG3/SpsAgecVppP5/nXj1ojRaGdSoOndKG1Wh3/cQtuQA?=
 =?us-ascii?Q?DPyNGOZ2HM/n1TGUMRj+utI5RVes2OSs6MG+ziayh8IDDj1XC+HuEF6RGf+l?=
 =?us-ascii?Q?3elRGri2r1kcjyNwgHhbyDX9p8iCKe3W/hfHRFFftW9EDd2GmbfjC37IShan?=
 =?us-ascii?Q?DkaENFzSQLtvmKqTAHvSPBp5IhkRXnfZepXkxkmL8A6/0+5fNlJhabYcoY5G?=
 =?us-ascii?Q?4u273/i/AFxuc8AX7NiBO00ITmRfHYTlue+NOYdVanqInT6ONpeGPAMWTkPz?=
 =?us-ascii?Q?O6SbGqMZWRXNfD6WmDdrv7rj17uOYF1/m7RuxWt6z87caQ+5p8YzDskrFPKa?=
 =?us-ascii?Q?yUPNJIsAqwGjWZb96/gEQqSfOvpJqD+2w9PxaHuaXFPEYQcEMgUIz/I9JP71?=
 =?us-ascii?Q?QC+H/Scp1iwqvYgDdFKIHLeVJzGt8CZ7jE6xeZgStiSbjNsOEOnV2niCmnm0?=
 =?us-ascii?Q?Ncx+18/AwNnl2r3ZQgB48BvjCl1DBws8C7+kVHE6rxsNT+nxpS4E/IgJBdU1?=
 =?us-ascii?Q?g+yyVt+m1A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f5fef7-1806-43a8-7755-08de811d3ef4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:26:14.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtBLIoRAri8yTraZCx3I7858WJYfqMqVETv6dmHqDxiq+ZM1jAC9VzXP0HYVxcD5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7997

On Fri, Mar 13, 2026 at 05:03:28PM +0100, Danilo Krummrich wrote:
> >  /**
> > diff --git a/include/uapi/fwctl/nova-core.h b/include/uapi/fwctl/nova-core.h
> > new file mode 100644
> > index 000000000000..3f1d94b44ec8
> > --- /dev/null
> > +++ b/include/uapi/fwctl/nova-core.h
> 
> Why is this not include/uapi/gpu/nova-core.h? This driver does not live under
> drivers/fwctl/.

I would prefer if it did, but understand if it doesn't want to for
reasons.

But the uapi headers still must live in uapi/fwctl/ not someplace
else, that is important.

Jason
