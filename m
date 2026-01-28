Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390E19E97F;
	Wed, 28 Jan 2026 04:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769574834; cv=fail; b=q4WhuTKy8CvAMIsJc6o7GK/yjsLwBnQ9vesVa5FMfyEtr5kuSiNP4ynV4WAgMZ4JBMKvG2Z440qvb+n+HUsgbRS9d87EPE70snYYHsZm0guWBCmDYSHCHSRJ02fwjfSdc25ItuGdU8Z4SC7kFU3qfgikZPGBic0wxSD4OQ8V2gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769574834; c=relaxed/simple;
	bh=VX1Gk3DwK/5VWrAK5Dou+LHx7oOGQpZlsN0O4YIn4nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gEIVvIc9CNlKQoGaPqrSrGexMTupSuW9Qx24vOpkShP8FVz8APm1Zgzhg74Wu0XCYXcsIHCMQnhgHVkZlXr2fehRMFMbKz6c3Z+pLJ9WRfV8BuMSo6fU98Ej1t1CWSXcmYOomnLjoUgakodok4vb/zZD2TePkSTwIZiTs/wOYis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cigG50/c; arc=fail smtp.client-ip=40.93.194.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cigG50/c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHeCTM9+cmomuS1Zc13ivA7jbAVtCkGnVe0n2XhPlZ0olJ8dNca6AfOlS1e0ER0dF57PvWVviv6RjYAiqR41qdIsjPBoIh5dqTORf18aD66hSkNs311H0u4Zta51Ik5wmjiEImcaFo1zQRprv1HHZorTWBazqtMSF31X4brgM2fscavx/cOEvB6gmLou4egxHzZgmBZHF1okA5RlP8zgcxUFiFc/agLVVvQI2M6Un2AdA2bMzFbOnXd9L82s0osG/Gv49fM7j3stNncQHd6QJaWauvkr525MZPx+SA6FvInXMCtB+BRobcTPIW9h2W1UoG5IJJy+f/gQUDq1ED/KGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXDU6PFr+Pb0SOK2DxjsE0T0qbj/ndd8bTT4FDETqS0=;
 b=eI5HaeWAJct7l8bW2dRN8h6SfQojpEwI6fYpTRivTLE42bltwMR8nceZRckTand6jl7ycyRWhLBwy8rXUh/VEptcC5yrnRTA/08FQEpWv/ToEJT4VuEFxrVk8Q4aI+1c+JCZDbxSr1jxpxy7AHKaZvcYGVte0J7zRfYg8yMSh7twiNMQ56Oz6vb4ACMGFUFZsdfoGF6FoK5oTVRYajuJAQAXvIiAQ3q1ehb0P3ieO0GVvUowMVvGG8au8Di8w81ekE6uof5IlkQ8klh0ovZzQQsWTLTqoToSGojyMUy7HwzrDJib29ciJwmKANEr/I6+H6GIiFK36yaSPPGSbfslzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXDU6PFr+Pb0SOK2DxjsE0T0qbj/ndd8bTT4FDETqS0=;
 b=cigG50/cuC3iHCHQ2hneg5dJZ3cgWWX+mxgz/Fw7DPcaqLvr8kbG6xD0yXFdUJSsWaHv9x3depzI8YCwvwyc2IlEQMLguS+v7A5eFCglr9WG7gmZvsZGDUx+QB6DfXLPgxlsrej4xoeztELHdKWMJfni3Yk/9vh0NQK5ehcfX8yqiV3NJkpmA+pzQNwIuifHACan94WsL/pEGE4IQmhIrXs67jx/puMYsUbDAwd6/VyEdZvovVBFavNfLBmOyVURgQw9qkQQnk+wk2f/0ycGl8/+J+6EG7ddwn2/ZK4Eo3x+iO7iKtfEdEMeEjg/gC53F0XzZCzS7PUVL4Dk4V+KrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by LV8PR12MB9360.namprd12.prod.outlook.com (2603:10b6:408:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 04:33:49 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 04:33:49 +0000
Date: Tue, 27 Jan 2026 23:33:47 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
Message-ID: <aXmRqzkKq0bAQaV4@yury>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <DFZGOCV6VP2N.28M0CWIONBGMW@garyguo.net>
 <DFZTVMUBOHH2.39WYY2O0F48NH@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFZTVMUBOHH2.39WYY2O0F48NH@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0698.namprd03.prod.outlook.com
 (2603:10b6:408:ef::13) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|LV8PR12MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: 89583ef0-f92e-4c7f-f63f-08de5e266ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jCoeee77soKyCjQShtNvnUxI7h6/TBSfmflEMAS+fjLsDzVspv3C+SU9prT8?=
 =?us-ascii?Q?2QT1JnMFVVDS5Mfm//1BKyO2q2vdNFLWvdb5iY7TKiIhLhys0ezQPSJqL3VK?=
 =?us-ascii?Q?uY7v3JA2Yo2OtDN6YH/02XlCHc2dvcfGI5oFgslD6Var3dF3Ibmbyhq+HAUn?=
 =?us-ascii?Q?icuQXM9I+mjj6ZHarVFEUPfAJysqaPyvdmeCEEl+FTDQTyn4+GjPYComnCvs?=
 =?us-ascii?Q?0j93UmTepx1PZ6qAhMaofrhzYerZwvxxwFQ32EPl9rjww19EPlRaP9O2JaKm?=
 =?us-ascii?Q?x4Vm+g9GebHTg94LgVjgkvseeASI3XE79l3f9AozqyFv0GwhSqwV+HMDS8Q/?=
 =?us-ascii?Q?jLCIdbst7zDpRP9GHNeuVvrd6dclPjyv+wj2m3nv+AA1n8JSuAE0ZtvEUb55?=
 =?us-ascii?Q?5N2dV6iEZDgd7ZUexVAhNDftbgph/ZamZGgeHXi1UL0V5giD2xYYpMHATsqy?=
 =?us-ascii?Q?tbzT9QzTbSPuXG7fD6SMhvCIzTb5S7gJRUSaQIfcMtvhGaJgW6euykTtkl1L?=
 =?us-ascii?Q?HFAdWQPHaGGTXJeX+Mb6KB8E2FS3wNPSGHqleldJj2fNy0EYJDkj2QenIzpy?=
 =?us-ascii?Q?kflge71bZ5dz6+mSQxsujPlwKVL3miF6QtORfws5oPjue0afPYXr9iLrgQIZ?=
 =?us-ascii?Q?HGIEBoDd8+NFNZVQCXbPJwp9D7GDk0gpbUQQA501VoZSLy4nQddOH54Lpea7?=
 =?us-ascii?Q?t7IU7vxin7MwgBAWKxgB8kXY/FJPWYKCHGy7QI3xrioT6U403s/eMeYYaYY0?=
 =?us-ascii?Q?sWFMrtwKS22T18C30Q3vztP3MFQAtsBvFUWRVBrJgvMEFDMSE/xne+nFl3SF?=
 =?us-ascii?Q?IlztIDirQbderXv1ZIFnEVHNz1WaaKsRjA1vHK1W/y3Fw5c9ZacWIdr53bTt?=
 =?us-ascii?Q?ZIoU0BIJ2DSNKEMcqYJr3SCh7Ee9UKsE0TWsTHLgb7fwygpvEQBjEiqjhU23?=
 =?us-ascii?Q?t8Kl6ON3NZm0JFTu74AHCtVh2wmlYcWdkot/CoVtl4+2+JWv4rSeX8xCZgkE?=
 =?us-ascii?Q?6Z46/UC+R6gd0gLzfiycmth12Co0ocaQDNztRPhwdQRZvciJbixpy9rFIxyH?=
 =?us-ascii?Q?uRgipIjTPRkE3Fqe5k+ngyyiZcEiDRe3loQApmYEeGQW3C8xBMytDZuVPNdY?=
 =?us-ascii?Q?26UHjn6t9S/+B5yu3AjKDfnm0dhEx4cby3g6ZLLmoCM4sbhj5m1vUOHFHPFN?=
 =?us-ascii?Q?8s5mQzykevw0Oqqu5sirdcbBvHeFK0qThG8oYOJSecFFRSgRoqDl4OV86Mg7?=
 =?us-ascii?Q?p3a1vOnHx/s+EEPMJaL/NN+oz77bCApAs/IqNMX+YE+nsdBunRYQumYrpc0f?=
 =?us-ascii?Q?mdeEANePEa6PNraNvgEjT+UdBGBidYHcW72MVmVaJKKk1YvZA/HFG/YW+ofZ?=
 =?us-ascii?Q?vfWj3wkZUQg8/xsADWuJNCC2akxEpdBld6AmeQvWAV/6wNbcS2vquMdzetK2?=
 =?us-ascii?Q?2VV79h9bgl1mF8cmJjr9f0fPzPhWm/dIwf0ZfDNG2KbZWAc8SMh0Djad5d7f?=
 =?us-ascii?Q?jLiqWWb7dk+JsHtagOACDeVf3fGvwLg8HJ45td2G7yDM6AfzVFJue3Qtuwq2?=
 =?us-ascii?Q?iJEST+aY9vs9ld8pkB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?94g9EeadBc5KDQ7wv2GT42KfvKxAUasc3ww+qWS1d8OyzmDC8I3wYVVVYr7v?=
 =?us-ascii?Q?Qz/gx3x3A+XCCrpD63kMtG7Of5ZHqEBeeO/cfM6t+lT0zVbY8KxN3A1uNcO1?=
 =?us-ascii?Q?MQzLTB6exHiP+ryJjzlwLkPpacHr3kZal++FORth6bDQaSsdx7RGZklMnzEz?=
 =?us-ascii?Q?Mb45yBSqPT6iDJFQbmOVfpjF8Z9CE2TswHyOfWKQgD1EYlPFMp+07fxcK9AA?=
 =?us-ascii?Q?mw6HJiKNNaqBvQBWGpg4H1dzQKDlYbwDseMLPmBvbZ/iSXa/6PK2Bqs8CtMd?=
 =?us-ascii?Q?4Tda5get/HMqYsTTlpWWo+VVQeCScNaudCtk31v4ucc/UTjn4Tr/Vjyhqe8x?=
 =?us-ascii?Q?ZpjkRAAjB+iK4uDhFCne6VqPymDqdQEp/bM1K+JsbRlgD8EdaTfF5S8+A9l6?=
 =?us-ascii?Q?9p2pXsT4F4s+XiXlKd0pCPttXM/hTpON1UGihHlyl76upAsc9IM0N0CvbXV3?=
 =?us-ascii?Q?eWsZAvBgweezb28v7Td8iDDER+kPi7Tvp87ur/JgFpTPINUI2Csab8TbmGnv?=
 =?us-ascii?Q?YDRslRKKmLr5mSeCUBMusn+itWJ5VXumgohpjsGWTop0qtiwW46C8SGsuPZZ?=
 =?us-ascii?Q?dKh6GEtpp0wxNsYpO7aDCynqo6Y5Wy+2X4f+uyNaPr+NRsURNZQJfC773zuN?=
 =?us-ascii?Q?yIXH4RgX9S6y56AXln7NJvgKL9BRpvezLoyfEEeDtyFgpOycXpGRpJKL+dHQ?=
 =?us-ascii?Q?7G6Aubg28OnaGYvguaE8qWO93TnABi6XBP2vNlJ6loTKQc539FgCVJU/5T7o?=
 =?us-ascii?Q?dfu92MTsqAGYM49L0XCmACWWBCjfRmket6D+HHeN9LG9pTDP7PwbvgWP8xyg?=
 =?us-ascii?Q?kWmLT0MK2gGsGzjUvwWCIkX+H/9VqASIByu/m+BBcoukif9PfNA2BFMiHXEx?=
 =?us-ascii?Q?IL8BxsPPqQzxLwFgptuZNmXv5wz/1PicXb0eDm68IpAN5qGY1eYm1iuxkdld?=
 =?us-ascii?Q?EDkYQUtWyYlkeXq6Mm4E7wIc8ozF3p7W1gdLcUAryKz+a78A+gShwR1qtTbO?=
 =?us-ascii?Q?ekMD1+G/U5DTm72wvm7RjpvHEtXGe1LwEertoZxLayUVSj2SJ7v4zEUSVMQv?=
 =?us-ascii?Q?YdyVZCM9z7jNvAc8Pk6gYOLS+094uGyn9/uw5FZvw4FUG/PRfGcfIjkmlZdS?=
 =?us-ascii?Q?ZbX+FaFXm8QhTlPp7CZH/S3N1u6sgVyAdlRtkoMIzyVlU8qT44o990zuqe9N?=
 =?us-ascii?Q?RXbqFzmBpChI1GG0G69VDt1Aktp8kpFMumHPhg1F7vOzPUQa1yrSZ7fWSctU?=
 =?us-ascii?Q?C3cqQi6gfJxPeAKin42yZSf6hxsqodPptkBm9DZ8oTj9tCTzindTqtxRVTx1?=
 =?us-ascii?Q?Kc/YHtM4+W05ykIMJtt1gR+qg+C6Kstqr9kxejWzJ2rRrk4di+TMbM3LLa39?=
 =?us-ascii?Q?FOlAb+ayF9b+PrbN7bgYy1lGSQgiXJOuhfGgRGer5UyDBVEYGrt1Y/tYE9jg?=
 =?us-ascii?Q?rFkudvrrbjBZF5jm3CQVSUvBHr1boYzJ+ikp7k1/MAimztJidAhlwIfznBIy?=
 =?us-ascii?Q?WL4GhgvpQ+sD2XudzisAXnF6bNQsKOlll/2fbE8JZt+f2S0A+EgntFSIYbwX?=
 =?us-ascii?Q?TZGmBiXrqOOm2S4HAoWaRoSlOz7DMpk8FeXFcSDdPUUL1YQyLvUMemIm/RUI?=
 =?us-ascii?Q?+yxonWMrBXlPuneR3GHUvWz9RbMcMVgPDKyqvgZvVgU+FYW/YHBDytZsYiar?=
 =?us-ascii?Q?y8cWPyP31kuBan+MY2dUp8T/EAQl49Qx1F4mqE5d0J76cippvAuZnXqGGHVo?=
 =?us-ascii?Q?/3vLcF96Pt//Mo1DSlv+V/78EWEGpz7JHIiKnbrtZdKQwIoDH3ht?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89583ef0-f92e-4c7f-f63f-08de5e266ed7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 04:33:49.6352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueeUin8dyW8z6TsJIwSxF3gNEKYnXAFNXmjtR3GzHK5Fl1YNvj4fcHJb7Le2kmPeKGNyQp1ppaREi0SLSk1A0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9360

On Wed, Jan 28, 2026 at 10:23:36AM +0900, Alexandre Courbot wrote:
> tatus: O
> Content-Length: 4095
> Lines: 108
> 
> On Wed Jan 28, 2026 at 12:02 AM JST, Gary Guo wrote:
> > On Tue Jan 27, 2026 at 3:25 AM GMT, Joel Fernandes wrote:
> >> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
> >>> On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
> >>> > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
> >>> > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
> >>> > > > Add a macro for defining bitfield structs with bounds-checked accessors.
> >>> > > >
> >>> > > > Each field is represented as a `Bounded` of the appropriate bit width,
> >>> > > > ensuring field values are never silently truncated.
> >>> > > >
> >>> > > > Fields can optionally be converted to/from custom types, either fallibly
> >>> > > > or infallibly.
> >>> > > >
> >>> > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >>> > > > ---
> >>> > > > rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>> > > > rust/kernel/lib.rs      |   1 +
> >>> > > > 2 files changed, 504 insertions(+)
> >> [...]
> >>> > > > +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
> >>> > > > +/// let color = Rgb::default()
> >>> > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
> >>> > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
> >>> > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
> >>> > >
> >>> > > Is there a way to just say:
> >>> > >
> >>> > >    let color = Rgb::default().
> >>> > >            .set_red(0x10)
> >>> > >            .set_green(0x1f)
> >>> > >            .set_blue(0x18)
> >>> > >
> >>> > > I think it should be the default style. Later in the patch you say:
> >>> > >
> >>> > >    Each field is internally represented as a [`Bounded`]
> >>> > >
> >>> > > So, let's keep implementation decoupled from an interface?
> >>> >
> >>> > That is unfortunately not feasible, but the syntax above should seldomly
> >>> > be used outside of examples.
> >>>
> >>> The above short syntax is definitely more desired over that wordy and
> >>> non-trivial version that exposes implementation internals.
> >>>
> >>> A regular user doesn't care of the exact mechanism that protects the
> >>> bitfields. He wants to just assign numbers to the fields, and let
> >>> your machinery to take care of the integrity.
> >>>
> >>> Can you please explain in details why that's not feasible, please
> >>> do it in commit message. If it's an implementation constraint,
> >>> please consider to re-implement.
> >>
> >> If the issue is the excessive turbofish syntax, how about a macro? For
> >> example:
> >>
> >>     let color = Rgb::default()
> >>         .set_red(bounded!(u16, 0x10))
> >>         .set_green(bounded!(u16, 0x1f))
> >>         .set_blue(bounded!(u16, 0x18));
> >>
> >> This hides the turbofish and Bounded internals while still providing
> >> compile-time bounds checking.
> >
> > I think this could be the way forward, if we also get type inference working
> > properly.
> >
> >     Rgb::default()
> >         .set_read(bounded!(0x10))
> >         .set_green(bounded!(0x1f))
> >         .set_blue(bounded!(0x18))
> >
> > is roughly the limit that I find acceptable (`Bounded::<u16, _>::new::<0x10>()`
> > is something way too verbose so I find it unacceptable).

I agree, this version is on the edge. It probably may be acceptable
because it highlights that the numbers passed in setters are some
special numbers. But yeah, it's a weak excuse.

If it was C, it could be just as simple as 

        #define set_red(v) __set_red(bounded(v))

So...

I'm not a rust professional, but I've been told many times that macro
rules in rust are so powerful that they can do any magic, even mimic
another languages.

For fun, I asked AI to draw an example where rust structure is
initialized just like normal python does, and that's what I've got:

  struct Foo {
      bar: i32,
      baz: String,
  }
  
  // Your specific constructor logic
  fn construct_bar(v: i32) -> i32 { v * 2 }
  fn construct_baz(v: i32) -> String { v.to_string() }
  
  // Helper macro to select the right function for a single field
  macro_rules! get_ctor {
      (bar, $val:expr) => { construct_bar($val) };
      (baz, $val:expr) => { construct_baz($val) };
  }
  
  macro_rules! python_init {
      ($t:ident { $($field:ident = $val:expr),* $(,)? }) => {
          $t {
              // For each field, we call the dispatcher separately
              $($field: get_ctor!($field, $val)),*
          }
      };
  }
  
  fn main() {
      let foo = python_init!(Foo { bar = 10, baz = 500 });
  
      println!("bar: {}", foo.bar); // Output: 20
      println!("baz: {}", foo.baz); // Output: "500"
  }

Indeed it's possible!

Again, I'm not a rust professional and I can't evaluate quality of the
AI-generated code, neither I can ensure there's no nasty pitfalls.

But as a user, I can say that 
        
        let rgb = bitfield!(Rgb { red: 0x10, green: 0x1f, blue: 0x18 })

would be way more readable than this beast:

   let color = Rgb::default()
       .set_red(Bounded::<u16, _>::new::<0x10>())
       .set_green(Bounded::<u16, _>::new::<0x1f>())
       .set_blue(Bounded::<u16, _>::new::<0x18>());

Thanks,
Yury
