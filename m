Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60812E3395
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 00:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826438; cv=fail; b=MsRDdk3thZ+Kl3ERP/Ecuh/CtLlURlsA2MpBFamWWssg3+F1SHMKSCn92yfINDChg8HAHFsvjzTn9F4aGZGds2fM3cf0ulty7u8XBWDqN9MBgFWL9bSRUtOGnnrd2CRvjCTqAuRIvwtU8HBtoO3rnTSslHfQUtvYdfpO8rFqAzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826438; c=relaxed/simple;
	bh=+cNKb26g3cL7sqmRm8S2tGFHyFP8ZfTWYZzRD9EhYow=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sl2vJkTHDIhz+ptyNhGOW9VwOpyna0OIVh8ILM5sBiEELmKDB/Y8UveqclP0q7JB8cAqx/deZVtN/I3MGFQWdE7X4gyGNDO465PbAtzCbINicEEhP8cvtiO9K3xT0G9UlzE9eBM6z57Z98HqRyRT8KdsU6iqD3ZxhCTWz2uFmB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5PCMEUy; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5PCMEUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741826436; x=1773362436;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=+cNKb26g3cL7sqmRm8S2tGFHyFP8ZfTWYZzRD9EhYow=;
  b=H5PCMEUyzHMShoW2BgrhcHv0rZRIeEcGNkABC81Fisnba4oA4IujtP/S
   kddNAfCvWSsNwOxpa+XA3Of26udWPsGgbLg2ZxNxSfQm/kncYj3SBlkX2
   +UZw4I4hAAd8uDwtk+9//6lQZvFScHdaBc/JeQPDERFJ4HQqEmRmGWne2
   tUWmwlDQdTEewSEE3+aelaxUjcZ1H/+83fk2WWiRhc2FWKXOC01MgNB2k
   71QriqUN6Rgr8XcHQMkIaijGmsd+aWKb54yjttH94rZeP51eCFjdfz6k8
   V83KdIM7Pi4SYyDeJQsu0TpwVg9IgxfQzSGD2FfeOxDwUm8Juhdu2Ozb2
   g==;
X-CSE-ConnectionGUID: l7QfSgezQfqDFoapeSArWQ==
X-CSE-MsgGUID: jZJDeZE3RhmvOjvKnoFW8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="45702426"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="45702426"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 17:40:35 -0700
X-CSE-ConnectionGUID: JbPsJeU+RrCL1OwiTzITTA==
X-CSE-MsgGUID: 7tbxG7bSS02xWGd91N7R2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125875545"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 17:40:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 12 Mar 2025 17:40:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 17:40:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 17:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGIXX3LSM12JQvnBTwnH+6Jrm0JYJmgQaRKC/OXdAJVXd2tOskgnAeiwjyGaumnE2I40tj+2T8/PKJvveFZqsv4Cfksr4fUSWtgoh7HJ+pTS475QDU17EuUgnuBs0yrM12XowsmDoVrzhZTgt70Y4nrDozQKTunWTWqQgQV9tuOXfeCVhbgPkk7EmLQX2gucceg/vCR6ozPI0K8fOfth2Xp/0UoObd7W7SoZ7hunD52c7fQONUDtupxkvykGJwID5KR/zR4rl5WWHYvQhiupBGmEhVIzrz3ijC62P2gO9pNfU6P8SZBQKYhyXuWisxdS2n9I0qEDEyaaTDj6F5By2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmR4zfPqfyYLAbfE9oLTdxd5mHWam3uQtGZbIBLSnSY=;
 b=QiK4VfSt69LxV2RNhFh2t2zGr1ub6djQtG/KRnV3VJlH3v12e15Ua/h7nbRSFirfM8dGELqY4Jp71+ECRpeULkGMeI1885c+PoNBo7B2sfUWTmYKave9ZCxrvk8Nyunm1siAydCfTumcXb5Qg0nUlztblwZvrjtCrbANUG+5oveCntkEMOn39pRZaxv9DxJ6y61sAbouzc1VktX1yLIKhI39HRBKuirQ3dtvXZ3VRtrF/wndXMCOYGnuI1MvdVBe47uOSOLVLvKB7iryO14m0BwTPSYaaOQJXHwjJYpljmfykmxRh9GlkImcAi9FrurLBNG8MKgWO7Kf+73lOZZzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 00:40:17 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 00:40:17 +0000
Date: Thu, 13 Mar 2025 08:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <daniel.almeida@collabora.com>,
	<rust-for-linux@vger.kernel.org>, <felipe_life@live.com>, Filipe Xavier
	<felipeaggger@gmail.com>
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
Message-ID: <Z9IpZucc6V067mh6@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 93348c8c-442a-4e05-f309-08dd61c7a03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Svg6Zf1Vg3gkG728qG6mRGcHMceLj6+Y0EMlaH01kjBfmQYvFpT08fx5qEt1?=
 =?us-ascii?Q?ZDGiGXdt2R79ycsVSpgsLhGzbdVqcWDnzveAnaDzbfPX7PSihR70lRPxo52F?=
 =?us-ascii?Q?G8CVbok8Q115CFnUFtjJXYC6EXozYcYbgRdrycY0p/IA6lHXG6JBOYADNUzr?=
 =?us-ascii?Q?mOM4e8lYlqY1ftV6er08T5KAgJkni5YwwfR8j6+8xHJb/9lHS14poLmfTUbk?=
 =?us-ascii?Q?qcI2TxUCfpd1ywEx0N6ef88c7bMNc7BRtv/QRPrEuyV4i3sjyLSJE7G+xuZO?=
 =?us-ascii?Q?TqmtUSxmahoo8LbyPFmhAsLm0NiMOE7/t9XnIZCtVgMk+4JHqURGyKTsxUPA?=
 =?us-ascii?Q?8W+ibQpglATPNAWUaOjEr6KPXw1s4oVMkp0NspmOJvErchaDak2NFeaYLImP?=
 =?us-ascii?Q?JYRr3P2Silpk+5xtOjq6e0zZ3JkcHu+rFGZzWDwCcRaMZzkxMDPdn57XeafR?=
 =?us-ascii?Q?odqzLgA8Ldw1QAX/lytfMeo/TGbGXRbgEYeKcouhIPT2QhxRADURL7qDXwUJ?=
 =?us-ascii?Q?fAtHBEyr9BO8dkU9Ky9Tf+Oor8ed6QKmAkYCrANs68FNCcTuWDR7dKDsTo5E?=
 =?us-ascii?Q?pu7/d6+6AOMziPcjYRqIyB0qP/0qDjToZo8Kve8TVo8G6roO4qDJKW3xZp14?=
 =?us-ascii?Q?7mTc+KxZsIPDduJyJrFTZo5l/Xfn9BQJO2HFuWeDGm8ggspZbHZ5LTNDgHp7?=
 =?us-ascii?Q?xWT/GBW8QEcEmOyKfNmEsebgCmDcpEMF6CORXYQweLfSUpbd15AzP1VErWNU?=
 =?us-ascii?Q?E7y9L9REfBrVLenLWWoplrSH7anJPuml76bVYyoBRkQ24jI+5ov6cNcoQ+cP?=
 =?us-ascii?Q?qwCTjifWoQfChMoeSzrRCQFdWZQMXMjnUf50Q4mV6y+zZAQ7q1YeEjUcjixv?=
 =?us-ascii?Q?A8NrGn1mq5wTsDWRS9wQ03KpueUvHO7/G6RWXIgYZLIlSFDhoKh3Yjn5cX/7?=
 =?us-ascii?Q?IY3T65MJ+uQPGVGGZL5qhIAUoA/q9dMwOasvj+8lXX/zZCHlHGKAxbjzD4u2?=
 =?us-ascii?Q?mT3U2fY1QCvtyx8ttwDQG59gqA79RSe2aDyp+BXb0yicpTQP4ywhQrN2YAg2?=
 =?us-ascii?Q?fGxClUjQFD2ZAOj4Tk2KzC6RcjsYgMVlE//TaSAcXeOTYsJmAxXmIjHVVflB?=
 =?us-ascii?Q?RObNt4HWbKGqeLwhYgzZklx1wCQFVHrrURobrVHPXFoL+4/aSNOp4ntsTg5E?=
 =?us-ascii?Q?sL7zyT+R89mWHUT1G1C9EznEIjrlEvX5HYKqD61QrytDWWfX0l2uFpGOORP6?=
 =?us-ascii?Q?3I8psa2s8h6qWJiiXf7b97Fgg//WjoqMW45moC6RJ1jD+omg99YQC8aEz9bW?=
 =?us-ascii?Q?1K3HvqEcYCOlAbaNeFfCNB8vv+PlcESi9dPc+D2Yby2kQwKk+4GU5irhSYdv?=
 =?us-ascii?Q?ykB3DaRk3V2HYf2WwNQZwutE8nEB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?emC1uHwQp5ek7vx47PGkDr0oQU+T1FGBLv6eQworhpvTJNU0ioNG6ymS6yjY?=
 =?us-ascii?Q?eg4O1xMfbEIAPn9HEfa1PpGvKwf3rzgflWO2bX3sNzMDxzz3lYPNlyMnoSqT?=
 =?us-ascii?Q?MNWGkRm5kF2of3HMAfv7qXJBVhokwVqqDdHvtq2IMlZsALj64b7M1bI7Bypx?=
 =?us-ascii?Q?noEpBSr1gW4kgaG0UDDiXLAWCcCiCwFQqUMin+6stC9b777w4pmZREHD3ejU?=
 =?us-ascii?Q?GhB2GPhUo/7elJeygGO18M/CHgCylbH4IIg6vIXYNDHgzkBSuemH4W+3o29J?=
 =?us-ascii?Q?vUwc+iAItWlYsPhSe54g8hMCs7ACYEdxrXuXMTFB4s28J7rNcERupS5cjUf2?=
 =?us-ascii?Q?PO4Yl6J0jFQXJiUAoH3V1PQJ9WH3HUoz8wKD7+g/yhdKWJ0RI2Z3cvgzswAa?=
 =?us-ascii?Q?GCDRzvYAUgq+LtX8/oU24+3Weox2g3daCfMtZxIhRqtg4bzREtXkbPg3u4HJ?=
 =?us-ascii?Q?pWmPmObgEV3WqQLNrn70As7VM88IkzVYZy3tDlm44bPmzZoDvQCP3jpWHK1/?=
 =?us-ascii?Q?5zfPFxXqRlBhaSFwXX/4f2L+eqKXWCssOx60apQb0ZzVETYehE7paIa+93Af?=
 =?us-ascii?Q?sPldvXpOWSxFqKv/aXXz56KJopx9q9KDUPj9UTuB6Ssgxex6MsWGjFRXcCbk?=
 =?us-ascii?Q?sqVXzv2dwBLObVPFzTvaVyda3sLqT/nFVkYXxQTMsN6gW4fUKd5dW11Guzhn?=
 =?us-ascii?Q?HbOvDutj65wvLxrJ58oIquRvhVNwjFYxba8/VOjnEktyEzoxptaK8LlisN+f?=
 =?us-ascii?Q?/mJmCN8BX2Zq9mBaI9WZ6/yO0aQZ2+uD6VL1Drt9bKSjeyN6QwhMeBqS9WXP?=
 =?us-ascii?Q?vCtFfhBrCNMOA83mXzpLa0hoz5CMlYct9cbCtxEZfJ4+5UaUwUQofCEe/kON?=
 =?us-ascii?Q?r8799mIG+s1t8PYsUwJ5362FKP3aB/CWvaoOH3QwINF7hYwpbMQrmG26xdFC?=
 =?us-ascii?Q?hLxgwCDVlmpwtWWYNNNJPRpNYxIEjLIIxOvCvhpMBLWUd50+DewnnoUzwqXx?=
 =?us-ascii?Q?c6uoyL8zhdfJS12bG9z6hX0ZXl0CDw/IVxWnQSeCsduL45Q2f9hb12ozBarq?=
 =?us-ascii?Q?YiPiHeZZQL988E8zomgCmbuXWZwMpeg3ChcfDqn+PRU3rIUOro/jeHxcabco?=
 =?us-ascii?Q?kK+Kj8vbEdjuDHy2u4FTjHguspLVgJUCVr3/NM+EuYueJ99GO99msCZOo+HE?=
 =?us-ascii?Q?/S41GI2n2vEshDtQzlWAkZWotNVblxuQB0VpWtNBzIf6E4u/SGDmMrrOuTAP?=
 =?us-ascii?Q?ZQGUozDjg/IlGFh2y+sair+uZuN12QInLSmNtkNYCblmIKAlW/WRlPxj+sc6?=
 =?us-ascii?Q?+/pw3pLgkMf7UlERCtJX0padjnna0SsV5MWXutHr59js+l4dmqU1PVYX2enc?=
 =?us-ascii?Q?nzu1zSyMhMYLP39Peu+MDsgcY1svPuR23EA+h2OoW1/dlcsD5G9bRcM3DTaJ?=
 =?us-ascii?Q?ixt0W6ImR3Cl56g4R4nSq0jQJolxyqkR4XXVy04HCiWAFNWIT4YnD14kx8nj?=
 =?us-ascii?Q?uOzf17N29psAkSdo+vQadcqwN97qpnylS1XoQTYbTJcfem0ClnWd4PZW7zST?=
 =?us-ascii?Q?9X0OvQHSdZWBPyJZ5X/M28rHWn/wY89utjB34RnO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93348c8c-442a-4e05-f309-08dd61c7a03e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 00:40:17.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoSUJYGR7i9/CePe768sj7KUM/k13vAWgaiNAZCsfkBGNDoc0Fq1fgIaEr1bkSaVxiBT1DsRLjAgblxGxvodrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-OriginatorOrg: intel.com

Hi Filipe,

kernel test robot noticed the following build errors:

[auto build test ERROR on beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d]

url:    https://github.com/intel-lab-lkp/linux/commits/Filipe-Xavier/rust-add-new-macro-for-common-bitwise-operations/20250304-205635
base:   beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
patch link:    https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b%40gmail.com
patch subject: [PATCH] rust: add new macro for common bitwise operations
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250313/202503130214.myqzPlR6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130214.myqzPlR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503130214.myqzPlR6-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/prelude.rs at line 22:
    pub use super::{build_assert, build_error};
    
    // `super::std_vendor` is hidden, which makes the macro inline for some reason.
   +pub use super::bitmask;
    #[doc(no_inline)]
    pub use super::dbg;
    pub use super::fmt;
   Diff in rust/kernel/prelude.rs at line 28:
   -pub use super::bitmask;
    pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
    pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
    
>> Diff in rust/kernel/prelude.rs at line 22:
    pub use super::{build_assert, build_error};
    
    // `super::std_vendor` is hidden, which makes the macro inline for some reason.
   +pub use super::bitmask;
    #[doc(no_inline)]
    pub use super::dbg;
    pub use super::fmt;
   Diff in rust/kernel/prelude.rs at line 28:
   -pub use super::bitmask;
    pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
    pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
    
   make[2]: *** [Makefile:1816: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

