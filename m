Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EB214A8E;
	Wed, 19 Nov 2025 00:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763510865; cv=fail; b=EefFu+2PesfK4kSlg3+rRpDQW9WHhGbYWBA8ULVKmFbL5NIOqyjia9zlPZKW1LkFy2gxRFZyC99VFhOjrCNFfWvclhFjyytQ0O+g+5AC6HTF01L1LCHSe+LRLJNQBU26iyJ87eyXCHjVLivG+w2tTq68XkYTvdlJGOsaOd5khaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763510865; c=relaxed/simple;
	bh=VZiBvpgG8e5fk10p18/bD1uSpcOrlF4Tp0NKn7Bxm0E=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X6hNQFVJFPLc4WEz8E7MWBFTVkhJE2r9uB4dw7jVllo/vntfvJk2EPAKiCLupvPXmuXw53XI8skMSdvZIC0gIixCo2HnOP4a8jjSNrNMX27IqUzhKlRl5FeCnkhxJKT6eeLe8eiIhtrD1AfGCVn3Cp1Z3tmDm3D1+ne+M1xcqtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e36Tw0A3; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e36Tw0A3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763510864; x=1795046864;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VZiBvpgG8e5fk10p18/bD1uSpcOrlF4Tp0NKn7Bxm0E=;
  b=e36Tw0A3s+viPInXF20dEXZUDec1pXfJa5v1FWpcnD22ap6d66DGGQ8v
   z0Hvvs2b1NeA+MHK+ACXwAoIVEuU075HJlPtbrKRoc7N/xcJqm0SViDAP
   shFeZjzfk/YZsHxrifPMl0jHIEDO4nvPqb1oAkD5dz8bGwUZDN+sslS0q
   1AkIynTI27QRx2HSJNzDo5iDRyzhA/QYjVZpPg2uahSgUe65skr9AjxvR
   YOTv5XrFIRNzUzhbGjG29Tk/z/e8Ju3W6JEMe17cc8X0dwnAKe8+Q2zx+
   vhba+6+085rvuJ3Qyhpm8Bbgn+MLEAhCgr+vSLqXi71v0sF3d5fHDhZFZ
   Q==;
X-CSE-ConnectionGUID: tg1HYvZqTXWJ8fdCgGXY1A==
X-CSE-MsgGUID: De1zm0ONRC20/JQHJDKJLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65480352"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65480352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 16:07:42 -0800
X-CSE-ConnectionGUID: pSV554ZdRuqzl96MTArUCg==
X-CSE-MsgGUID: oqVJkj33Q0OY88pwHKVK6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190150773"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 16:07:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:07:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 16:07:41 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 16:07:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pb9/sbP2YXl1XrplZsua+upt1gyYetL5vXa8KEHZpMqbo5+Nyg+M280usJEXoL1RfYX3miw33+Lh9xQWahvjRX0hIWPIXEatRhpf/oTW3euZbC4aUo4ZgHTFVi0V+XsZP3d0a0XoW3w/v21sCnMPGLathg6yfbNjZyo3qK8R7HwyGZ1nI7H9SGMp8S3iZ9k9XfdQZdHCibM996mJm5AV08WcId6T3Y+/oiqc0ZOA6ZLVCFcwwX4fqX7sFAwwN45e2Q4QKjJurtBb2c+lRcWRZnFE4kGJBX6XGaArFSlhc42IeJPshhQTR2If23TgHoU48sFbAoY+VF9L+JHT0aaJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpdyLh/6zNqbGKAH6EjD5QlAkxNHWHUIWozO2P6Ok9k=;
 b=N631llX39eEQP7wmww9mM5vmCdIN08q3oSBJUERcKxqr0lt3lwA9UvbdIE09C8iLaS/GU7hhQ92W8LYurZG/41sNrO2lsUJWtDixrnij+YGfBb5nMQ1JJuEiCtNK3lrt5s9GvsH6bxsJPn5xX2eNfuba5oXuHd710sNNG7PLdp5iTgSJyo+mlOAGguqcZXYOJLJ8X4Edgg03Egoe7iFI29wba4mql9hFbUwgdSCYwZAVNfaGZvGnJV1tF1LsS1MZHb7mOr/aYepAr3j8ZwAmul2Eg8DOMSKQtFOGiB6c4fUeuxzP8H5QFrtksNtxq/+IedarnimLgeMJ9ymeU8R+iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 00:07:34 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Wed, 19 Nov 2025
 00:07:34 +0000
Date: Wed, 19 Nov 2025 08:07:23 +0800
From: Philip Li <philip.li@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Alice Ryhl
	<aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo
	<gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
	<tmgross@umich.edu>, Yujie Liu <yujie.liu@intel.com>,
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2] uaccess: decouple INLINE_COPY_FROM_USER and
 CONFIG_RUST
Message-ID: <aR0KOxW3kPnP2z7i@rli9-mobl>
References: <20251024154754.99768-1-yury.norov@gmail.com>
 <aRxM_NHhekMl9joH@google.com>
 <20251118091818.152ba4fc0c8a6f3092a36fbc@linux-foundation.org>
 <aRzOWCcyJmGZ0hiq@yury>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRzOWCcyJmGZ0hiq@yury>
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: a5817e71-2d52-4ceb-75d4-08de26ffa409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1INvVocn866IsL8NdETG5xgO5ilw94sw2lo1FsLjv5l4w3TesXoDLA1fhbmE?=
 =?us-ascii?Q?VFcuGxdfhM0FgFwgnCdG0yVueNuJ+MzE4mR6xvegTLu0FTbzyS+o0mSnQa4L?=
 =?us-ascii?Q?IZnKC23I2zkqFNZP/YqhhZ0ImNZRZYRt7C95yvzdspZnasdEhR1DhvH4lDTr?=
 =?us-ascii?Q?J4t0t8Hzimr9x8yl3NLXTOowQflrxUnCtNog2E+5MuFsb8iQ3zTiQyesrpPW?=
 =?us-ascii?Q?8llLtnr0PvxGAsYHwQMdO4STbAsv4UJtxnAIVksC+mXybDpFAcMaJQl/EVLQ?=
 =?us-ascii?Q?eNhGgud4+jgG1q91pvR6swolTINU7Qftay419noC7KnTdKzgkg5idhlemkCc?=
 =?us-ascii?Q?+ITeU/mmbGE/ZSfonncGq58w9hTmH5nXMPh3I1Ts+xRe12edCOZIJwkwggE3?=
 =?us-ascii?Q?S6lkWnaX45/gOapsBmvgq6XA9NwWVBymfeFLJvf86aJ4SuR8igJiRGKmvg/H?=
 =?us-ascii?Q?AEECMYvxyNUsuLRwJbHAec9bWW735WxPCruQsfsqbapb08v1rnvzfkJq+f/6?=
 =?us-ascii?Q?fvry1INjOiGEJD/eViFhXZPW4025rFSzR10QSq+TRLK8aRxS+3y9uFAJ3XqF?=
 =?us-ascii?Q?SfPLe0M9/kmBBkV0sVd9QASKJkWXYkmw5nGhU04WRE7kU2a8Ypnssm31+skP?=
 =?us-ascii?Q?Q7CKLhP7LLdXsEbTE759poHcs2feYW/RuyFMWC4EfYP95sV+PQ5IlCYgBr2D?=
 =?us-ascii?Q?rNlr00lePwLqqGxeV4uSEKRVq5Gg+/eM9Y0jdef6uFQeN838sPT6dNfnrtbA?=
 =?us-ascii?Q?KDPh7dNw04gSsoeYALoj3V3cdMgSekm2C1qq82npy2SPCbuinDNclKzLLe8E?=
 =?us-ascii?Q?p/xnQHVxoFqLGJzAeUjbLdbWt7LF0LFv6r8hPMQFvangHRVpUR//6LnSCEyE?=
 =?us-ascii?Q?QKwcy+tATHWK2GB15seuEWeV2OhYhF2kOHEYipbGU2IG9+1ScPU5oCm64n4U?=
 =?us-ascii?Q?rWM+ORi87jBd0PNu2Ey+mNQzXMd+iNXJ9sdEottHv6CRqZn0Wzdg3oOnfOc9?=
 =?us-ascii?Q?JPaZ1vp1B3bSwv3GaXn9TopBYIxDTs7dEOq9gxdNIvXjsQVWfIOKezIGCFrm?=
 =?us-ascii?Q?U2YIeCmZQQAQUJbQxQMW5J7nwHVaY/1VX3qiFR630tSla4acdOA/IYjfzHQJ?=
 =?us-ascii?Q?v2uX70/DSri/qSW0p8mXk2M//DWaUOE6PpEZBxxi0H8lT71jdoiIucavn+li?=
 =?us-ascii?Q?AnL3I7Yuzk3JKsR+9ku/JnrVtVYEyhdFtlrTCxENOixk/denIqAZC0p+Z+6Y?=
 =?us-ascii?Q?5Os1sD71iEgKMjNeCsQfDKXJN1V7bOTVp+XaawyPWhGzaYXSTlDy6+2znApU?=
 =?us-ascii?Q?yOHwwYDwQlan0DcJPXkX+EoLbbqu4PQKvOE62RNATeOeI/KQW0Cuhv1AAWQj?=
 =?us-ascii?Q?PKLpsxM0mVONRuOMOvLp9EjwNKwrXctOXOB7tpi6osFmLd0UZPUOONLbhHsE?=
 =?us-ascii?Q?5GaOXEi/Xyl7cN/hWg4EVo3yRpxNCWbw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GdYLucH9ez1Fm7eUtkzk6dFRWLLtcvb4qL0ktr7qdFVii3jqTf7h0bDgCP8w?=
 =?us-ascii?Q?IBXL6rtAArHjzN9bLEyMGkujpzMaXvuN2fMYZw9UfDAkClJU4BvkHJEXiiR4?=
 =?us-ascii?Q?Le4fWwb6+2+4DCJ/QRHsUDg9f/vGg3ESx/xhYAxdP662hE93TUDJA+eJARky?=
 =?us-ascii?Q?lglu6oRU3v1ypcO/uG65deiXQBGpoVP5zWquAyyPw5bwp/3XjuiwA8DfvnUw?=
 =?us-ascii?Q?GvCXFrOH2vkcGUUUbvyfiKIMzxmWJY20DKD5fEH1HjCG6CQDUjKIxvIUhsIC?=
 =?us-ascii?Q?yEjVGCjUeMA8aOEWOqw2NoQBukVQmNF8qYD2Cj1qs0FVx9k5VCZitt9PmWy6?=
 =?us-ascii?Q?rTNnVdFAGW11wRt3W9u388mlsheG2Qt41B1lYBxHu+UspLec7fVl41Y013Up?=
 =?us-ascii?Q?iHxymGXR3SolePTWow3QhtQ/mEpi8fWECRAYieY77yK8MVZNHnoC9oex2h10?=
 =?us-ascii?Q?bloRD0C011Q1mN26oxo/TXPeAhZuCoe9rAYB9bMTM0YlYTBlqA0ANYJ+ZKF3?=
 =?us-ascii?Q?4VjmdY9zkwAylEZeFdknpXoPTp1NyW4UCBdVqSPTKzunx+98XWXXFZgVTyry?=
 =?us-ascii?Q?X7P1PZmI+oFSdJBGB/YAfXe25gQkk5S3qOGeba/2gS9kMIkZ4GxhKXXRY9yN?=
 =?us-ascii?Q?wJ9s24nZBZAKQQocGg9t8uXC11DQN/+yfzq0E6CrJKsbtnX2BLAkBPJ+3ZfN?=
 =?us-ascii?Q?eE+SIvK3xvmm6RUALEN5AJk9UJDrXxUGF3WksqmZia2FIroxd/HLlLXWdmgJ?=
 =?us-ascii?Q?Wz+ibqgNjWzUs7Cvd10sW4TBKikd+hPQ0mTz9lMFr6gAJWeI7280xEp4l6lb?=
 =?us-ascii?Q?BqZtASkbnob0tWEk0+Q4Hex2YMuuRgGpYcjQjjRJ0afwJsDaiGw0eyCLoYeW?=
 =?us-ascii?Q?xciK1QqzCJ+6dO8r0YGNw3lRRMxqi38qfvMDUkQGTB1OLMfzAimrx8gE+jHP?=
 =?us-ascii?Q?9OX2H03rEGglvZOCwcuHM0oa3iTnNLc/MQieM9TM2rQ+qRTS7BOZErPh38sa?=
 =?us-ascii?Q?lvTImHM9xbZhqesOx5CFQiKtQFGbmqpm82fE/cVXl3djf3435VSxeHICtq4C?=
 =?us-ascii?Q?EPS+jGHkRCxjrZMHloq/rNWysdcIeCkwo1ICTe8rij8uUNNler5J7KyFxC/S?=
 =?us-ascii?Q?PochKHGYYmAhOoU+rUKbaGFofnUqAVRQ1XLKSc9sIaq1yUpUmp6Ko7eBdAI1?=
 =?us-ascii?Q?M4c1OgXFH8mEqG7QU8Eeu6sZ/TIwbdkz+Rbk/XlRUUfLkzm+rIqT6poJrYfw?=
 =?us-ascii?Q?cOhOCR3rFbrbKAGaiZ25/ND0U9gl8RzqwtQFdZVEbIBwCM4N2H2o2Mi2QnDH?=
 =?us-ascii?Q?lEWonX21XrIac42Y8Ww7ARB1POXSLr6iEqrSh5Y4yCY+TapQWME81JAIZtSn?=
 =?us-ascii?Q?2EbTBgKqeiYWSzsiBZTb44JbbYcDxVGvZx3Ag535+tYEng3MUFE90n1q6Aam?=
 =?us-ascii?Q?nAB5JHbqc8j5SwBhz5aa+OTE5ndbTPnEY+CclE5cHu+wvqwJ4G0E+5SN6TCF?=
 =?us-ascii?Q?ELslFQRnEhYxFRCXvZjmEwjATq0m40af7uAl34KUURDYrpi4MYPEciVgOcMi?=
 =?us-ascii?Q?lYWaftvWXCtohWvpwPBRb8nJOd/G1fS5n33EZp/Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5817e71-2d52-4ceb-75d4-08de26ffa409
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:07:34.6566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVs63xOGXGsDZ1LgW+7Susk08q9gEEZrSseRItPMHa07DA7dNVN2xLt7mp8Y3ukDUKJ9VmRFA2MKeTB24YWZtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
X-OriginatorOrg: intel.com

On Tue, Nov 18, 2025 at 02:51:52PM -0500, Yury Norov wrote:
> + Philip, Yujie
> 
> On Tue, Nov 18, 2025 at 09:18:18AM -0800, Andrew Morton wrote:
> > On Tue, 18 Nov 2025 10:39:56 +0000 Alice Ryhl <aliceryhl@google.com> wrote:
> > 
> > > On Fri, Oct 24, 2025 at 11:47:53AM -0400, Yury Norov (NVIDIA) wrote:
> > > > Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
> > > > CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> > > > is enabled. This pollutes exported symbols namespace, and spreads RUST
> > > > ifdefery in core files.
> > > > 
> > > > It's better to declare a corresponding helper under the rust/helpers,
> > > > similarly to how non-underscored copy_{from,to}_user() is handled.
> > > > 
> > > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > > > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > > > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > > 
> > > It looks like this is not quite correct. The header file still has this
> > > declaration unconditionally:
> > > 
> > > extern __must_check unsigned long
> > > _copy_from_user(void *, const void __user *, unsigned long);
> > > 
> > > extern __must_check unsigned long
> > > _copy_to_user(void __user *, const void *, unsigned long);
> > > 
> > > this causes:
> > > 
> > > ERROR: modpost: "_copy_from_user" [samples/rust/rust_misc_device.ko] undefined!
> > > ERROR: modpost: "_copy_to_user" [samples/rust/rust_misc_device.ko] undefined!
> > 
> > I wonder why this wasn't caught in linux-next testing.
> > 
> > Please check the rust Kconfig defaults, see if there's something we can
> > do to get more compilation test coverage?
> 
> I'm second to that.
> 
> Philip added my git repo under his testing a while ago, and also enabled
> Rust config. I received a 'build success' email from his robot before
> submitting this.
> 
> Alice, can you please share your config? Philip, can you add Alice's
> config in the testing grid so that we don't slip through such things
> in future?

Sure, and I may not add this specific config in the bot but to increase
the random config coverage for rust side. Sorry about missing the bug.

> 
> Thanks,
> Yury
