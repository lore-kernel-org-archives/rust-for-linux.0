Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F1D2FDC5D;
	Sat,  7 Feb 2026 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770502310; cv=fail; b=sPwbmz/Yi/9k5rfDYIQDGAI2UIhnDY7Ynp3bIAGrtchLsme2uf3tTbsKDDviIomNW1oguEp9URKDEDaMsBPoYttlvBKkBQHtmFN9fBfZeJbWA8xea78RYJGwQhXNLOkWZgf/6UFqR0AwB2t/CEqOj7hMK6ZFACpWN4K0YTfAxDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770502310; c=relaxed/simple;
	bh=Y4UmXOXntRPjcvJkzukQOvZT6zUREGCmUoQeFSzpyMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K3SsUsc6aGGbzQyiGxKSUe29x1VjpUzQaq4BOdTuKd3OCmUZzRWGHVZQ9IkKg5GcR/0yTFZupEJVXxfayBDeNQdjC9V6g6kJjc6+4g0M1Hc8LrkLrBgDJRYrcE22hmd3NZCoQhHyo4SsERqHTRW+Jk9AXR3eaEWClvqw2zD9I1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QiD7GQyD; arc=fail smtp.client-ip=40.93.194.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QiD7GQyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my8YfWEjAYaB0zEj3iDzegyOc4h0aedcz83Y4hwQXoF1o5sAxlb+ETBXNbRqKhgIoLQdWN7yVsBerYvN+davq1zUTVGD/5Lhe2zCKaFw48XuheKczvqGHLKoYEfnhxG4pRDySMhZFr54Np4+kvTJyx4Bgi1A0yTBvmMdMFRvXa0yoGY4HODhfAifOwFUSn9igvEu4UrYa3mET66+0gPm7JIpDak0tZT3pnuIfbcbo4TR9cMnlryYgspECrLFE8aGLZWf61bfDc6ZVnd3CUl47gPyZdp1jt5fK2qgt8sWNfEQ1DNxKlPHVZ4p5JitZ+pqX+zhvVcufoA8LI+qjFJ9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oraCf/38bvL+0vImwINhCXAn92VqWglAYSHlppM0EqA=;
 b=vR7ZIGDpA+T0mo4UUBZJicjtckdh8H/3kt2YbhjA8n49uUeYiEBoKXNoh0cJY58J0GC/MB9zQa/UosD6dCidHd6gjibfj4TJMYUS1XMDe0ZsgvpZ4/10S/5srmY1SBJh8D2otJWoVE9O3QZ8xHc3qLSdGSXHx1f/IUXwErH/pHm3afIJ1IQRdbshdlC42YVeQfjlmzNCoaoEV0+L3HxiN/mV82QMhtedIZQZNC5sSIts8NWW3iOHeZrM0a9YlvTRgQnldTDi0N7YudS8qhL+Ihj9yK0RNxGW3jwyVfLhMDMWTqfSRblkfqO/7vQn8cjS+rF9GCXgFFiSx4xEIcCigQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oraCf/38bvL+0vImwINhCXAn92VqWglAYSHlppM0EqA=;
 b=QiD7GQyDage0dKhkHXO4z9Dj9Yx4g4uxB5xyT62FubOQM1Hn6ZlJQINdM205WK6qaD/wq61bmxBnmesOiIE880m+WP3330Bn+Dn/oc5nmMhVuftEYvQ+J45S42Pj/Jc0qA7XVikOAfucRpeff+1+IwMS1zWJLU+lS9SbujyH16JvLRzXiLYND5o6r7ouED8s5VIne/UIiW0q0Qy0o0XKdVFWzQSgKi1mEow4gNM1oqwzQOPkrgHnLeKACVKN6VwjvDrIKxNUlNKVa7/3i6ONmirW4gYova1K6K9kkFoEHv282e+V8bHP8Gd5pTmzbGTfrOXiq0gEh+CtPstzNQe+Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Sat, 7 Feb
 2026 22:11:44 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Sat, 7 Feb 2026
 22:11:43 +0000
Date: Sat, 7 Feb 2026 17:11:42 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <1770502064.0c13dda338916c42@nvidia.com>
References: <aYVXQVwOZapVbnP5@tardis.local>
 <6792E792-2043-4BF5-952B-90847703F23F@nvidia.com>
 <aYYIikXcrXFOZDra@tardis.local>
 <cd3e4e70-a007-47e4-8313-ae786e363a34@nvidia.com>
 <aYYT5w7qxIxM7cdo@tardis.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYYT5w7qxIxM7cdo@tardis.local>
X-ClientProxiedBy: BLAPR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:208:32d::29) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2dc284-d5d6-4cbf-5239-08de6695e092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OoMtbKNFB6+30iqMXz5kkcz2GpDxW5si/DOG+t64dvIKn2zqaYDOeIMOwpcu?=
 =?us-ascii?Q?gFUr9AfE8Be120zCmO5PHbwxykLbeXvKs23q0b0XP5Pt7CoeCojmIcvX3l9E?=
 =?us-ascii?Q?HnJgOU9fHinzTOwRRLpHE+olL0q6j1+jm8jMRZx1VuiSh+pW5fAnk3VhpjCG?=
 =?us-ascii?Q?QDtMPTYh0j+rIXsfGtMS4iHqLgHwK2gpF6L5kf1FPqA3mlRSc08NxIxDSL9y?=
 =?us-ascii?Q?qv+uYOg8JktR/D2Yz0I91XGhDqHOL609D+Pm7wcdsZHhAezVqOjnvs4NwV4Y?=
 =?us-ascii?Q?R+oezs0kBtHkoLydODdPBIpA2LyGgupnayspnMO1gsUPFTdlQ1lulzssBCy9?=
 =?us-ascii?Q?LhvfR4BiH5s8VIBvncChDasmvZDeVlYsLAmrU7xblY327Pun/tN9qJihbrsv?=
 =?us-ascii?Q?NvNb2juqY+/z+L2/fY8W4iOaWcRUq3hE2+GIdbaskeYrqQXFolG9AOz5FFJP?=
 =?us-ascii?Q?nsFVxvhdHjCZ49skvFsKXGdgE+a3Nij9n4BX3mfCf5BaRiVzyEVHfA4I6Ucj?=
 =?us-ascii?Q?2GxDG7e1H+59BrZyZ5pwwbyBsQ4wThwueGaUd/Yz25DY5hFgYQqHMFjdbLmb?=
 =?us-ascii?Q?M+ocfILP14h2UI+KfI+v4AnQpTjzJgDSrmRpgHCh2Ot4BDQ2UFDqstQUNpZJ?=
 =?us-ascii?Q?47w6bfWe452YKIVFl405L2/OhvVj3Po6UR+M7cX/MNm/3gtWAz9fiha4ubzh?=
 =?us-ascii?Q?IR/f5eKnfk5ZhFBw2DewhaoNdoI4aDfHwrfCpV2Ch7TKdBPbgEsK7LLWrNAY?=
 =?us-ascii?Q?aIfMjJxMc7uYa0cY/WXiUPpsXZdUb/SXDDxamx+z1A2+tufHchEE6sgLBsk0?=
 =?us-ascii?Q?ahvjpjWhDgxL3hpWXK1F69yMLSgULvxFyyzLGXc9h6Gi7V3syzlevD+eQrlk?=
 =?us-ascii?Q?q1Y+6vpztjcGaqOlB5BqpeNtX/WIf7uW24gRDvvDydUomdu+XCBLK8hBXJmD?=
 =?us-ascii?Q?a39cImAEXM6kjw/gSNLsdcgCUdr6g1rB5OpZJ4mBjwf8Lul13QaJ+bxQ3UwI?=
 =?us-ascii?Q?/VYzcTJoPsGnHhY+5NqIoE0jZHitzDVQbT2G73C0ywpr9zaoBnS4jBn0Vj3w?=
 =?us-ascii?Q?OfHXSsbtIILa0J1oXdu7PvkiIPUGDRySaiuTjQ+gYo7kZqUQx8N8geOLGHfz?=
 =?us-ascii?Q?utUl+9mo0AjT1G0NhWSVR6ns4JHay8INBBgiKPIqcCSwZ8TPksHCETh78x0k?=
 =?us-ascii?Q?xB7xfkIUfZA+/orTd99WZVmiYuwAokCICoy0CpHrjD1s6pAvS6elNTSiTRBk?=
 =?us-ascii?Q?fqm5xuybmxb55xWRU0b9uTS8IwNUcbBc3/fFfhyr/KKEoV+FOw+F5iv+CDuO?=
 =?us-ascii?Q?+Nh4SKGcoicr3WO6GREpRPRjqVLjBdomavq5ykfsA9o0Z9VbUxmO8OSAwDAI?=
 =?us-ascii?Q?tcjDuB+mkvePh5JhE87Jjan7ji/iDS7icS3sjmrP+85pHgrxZIrRiHPjVe7O?=
 =?us-ascii?Q?OnliyzZH6bvFSib2gs3u326j6TZ3FuZwQBB9PREOech9iNDCItD73Q02Qgmn?=
 =?us-ascii?Q?3dNUb41QDnta2fIb1ZYPcH4IVquZ0MzHB+jRVn9kB4SEq4uf+yzU6eCzQ0OQ?=
 =?us-ascii?Q?FDVT/rfiV3iHuyO8Kes=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AJTM1+ILzO24DnewJeJnrH+dBNgUabFsIqxi8kpt/rrjQVY5J8pg0GCVQ8VN?=
 =?us-ascii?Q?bKFy+c6sYWIm8xWZT7+STc8owTEUKNj9aHYArOaKWr16DFJ6jR1MPpuS/Q8q?=
 =?us-ascii?Q?aCXKSMtPYN86016t0KDL4JgODfqiD0QnmfwuH496/+zO0jwkOsA1GuuJNuOM?=
 =?us-ascii?Q?59RvMZT8Jp0joFlOlY3OvYxVuBMW5wnF9yL2o6JvGFTQYJjfKFRsoyorak76?=
 =?us-ascii?Q?NiK3wij2wKYnRe5auNyp2+hxrwC3i4hX/fKj+yWX7Q+PfXrRVDQRr90+98yh?=
 =?us-ascii?Q?zxQRNpVU+14SMc3GoO0Udf5wTZCgyzlcnPHmIqdHgnnmSLxtOIuZOEF0r/lM?=
 =?us-ascii?Q?T+WFNXWxkhLdvNI/EZ4cwiApIqY+Xq8/mkMWk6z0g/Zc0WYWa8VkQHm5n468?=
 =?us-ascii?Q?pQzoUOd5YRjlBWTDFeygaswiJwMCK2ND/q6X5qVf93K0wyTc5IQ2LYHlhH5x?=
 =?us-ascii?Q?D+ywmkIvDw3XvAVyypd769VP4creebGGEQfMPGdjs4Gwisz9aOuvHBdq83RV?=
 =?us-ascii?Q?QDNuvui12k0xQH7Qwat1jFF1NQ0vh9CmHSGjLmbiQvPiidIAIxEBUxQ5UxMs?=
 =?us-ascii?Q?jbcsvIt3Bfu51Z5rqY5wrQCJ6FBCz/5zZTbMEXLaLqhP1QeJLrKwnf0rjPcF?=
 =?us-ascii?Q?FWJoHdkQG/w2XNdpPPJUjdvlUqi2q6wmrenNLljRTYAazLcfTQ4q4HH65D3b?=
 =?us-ascii?Q?DKFRqn0yeOW76PZ8vV1DzAdsUHPIXygSRL2A+oZC8imCzrPjgGrLQU3JGbbA?=
 =?us-ascii?Q?J42Uu+0swi4m8AsjmAtgAcR+O7jA6HHhNfHFRPAhLUwk4N9nOAO1M3IRiBrz?=
 =?us-ascii?Q?TUAD6RnjP3ZPURLSOfvg+zwgzmQCwC3N470sRpQ5uGdzV4azplGtkTWOOT9C?=
 =?us-ascii?Q?wwv4g6bMKH58LHm6eG5xDliO/F4KT/R7NGWbanY//MOZhDrCLUeuVXHs13qW?=
 =?us-ascii?Q?IYZTsXHWcX1gAIGr49PEuPHv4fHKMuVc7+zA8OK3LBDqvqgjGEG4mkrh9oZs?=
 =?us-ascii?Q?Jr7+UfkTFG52yPl3GAx4PvfOGBCeD2mFSwQ4fO46V2bcD0GZy/FxpJ57jf1r?=
 =?us-ascii?Q?fKEA7oeOyHPVDHGTVDxhJTRkTDmrA0ds9K6HXKjGUlx/aiu8hL9ru5aClFU3?=
 =?us-ascii?Q?3Vbq1fSrU6jBC2gxZU0C63WqHayjNZu6Sg8+dIgP1322VxL0bqUSBii0u+AX?=
 =?us-ascii?Q?rk6AbQzcuZCmPaFdGQF4WOklGKRPAHWZpqefyc/EnEY2UF920emdxBeeE462?=
 =?us-ascii?Q?+XAFnKAPojM5EZvLpPAY/AJiSTiPZa9dAa6QhJ5wsOVQ6lMPRpKtSa+E2zsr?=
 =?us-ascii?Q?H5G6yJFzhkpKq7YLDq3XBMw6mq2HNOj4whI8uHlN8WHchg5o0ws9o++t0tzN?=
 =?us-ascii?Q?mzG1g7/OJsFGAOadGazw49U2aT6F/6fZc2wWIWSsXpIyCv8DRwywhODMJyNS?=
 =?us-ascii?Q?ijzM5lGYHGuUvk6FFB5ILNHWlI/P7d7Bh2uvrmUKLdN0P+cIrIqSDYMaAoT4?=
 =?us-ascii?Q?pfh0cziigV5JcjfF8VJB5uec46hmfJitl7z4QkYNR0aoMtxkMwxcfR6Fkxgt?=
 =?us-ascii?Q?8rRwMkobftyqwyZ+YcPoaFc4SJmnIF43HZ1pbRSGlTPwk/WJG7bwNurNA9GN?=
 =?us-ascii?Q?YUSy5asqGUy1PjCFIMFWIweHgYAbqXVjdwiOC4Ce+mwiVoiadHOBzo75lQun?=
 =?us-ascii?Q?XfrBtq0zoOXw103agnDlb1ZOqUAyNjnJlHgF4u7sz2DXAW7f2k7PHBN/Ukze?=
 =?us-ascii?Q?GOprsMSNJQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2dc284-d5d6-4cbf-5239-08de6695e092
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 22:11:43.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpbgwRixDgf1Gq/dPaAKnjlsD8D9K/e1Pip/11W1njhAMVBirWLEUt28t0Oi7z9D6qKb51mmaABegqpCiNx7+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236

On Fri, Feb 06, 2026 at 08:16:39AM -0800, Boqun Feng wrote:
[...]
> Yeah, "can't" is a strong word? ;-) I did say if we care more about
> performance on 64bit than 32bit and can afford slowing down 32bit
> preemption disabling in the case where "we decide to have additional
> preempt count flags", THEN we can make all preempt count 64bit.

Ok, hopefully x86 32-bit goes away before we have to maintain/improve
these workarounds in it. :-)

-- 
Joel Fernandes

-- 
-- 
Joel Fernandes
