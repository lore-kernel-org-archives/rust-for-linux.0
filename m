Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7656C12FF69;
	Tue,  3 Feb 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151145; cv=fail; b=iX38nL71/5nn5ZGgK5B0wbHpImyMQmz3Kl9C2zebJ3WZpALt9VGnKVT/Ac+pknFJFV5LyvsF8r8L7fCKq8yDQoV0/g/hIEV1p7upwtyHJfCpwrcbtt1yzxsXuou3LRpyMqF2BlzI4lbASnTchWFnLNS0R7LeadJPmS0gnpMWz/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151145; c=relaxed/simple;
	bh=hNSyF5hAch3RqsiXtbdVYOkl9Ucd+luVie4MnyxRbZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ojEoGCA0ZcoPiAKqPigUZ6XUjMbnXSRkgTFoBOFDpo+BV6PKkKXDYZuKJRTO3Qr1dqmgW+nhvM6yLczpyw6sKa4XACkExmE6PFb+VG+YHxED3pNOhsqCs9f3TKYkBYYCxHJ17dQN7k6OxFcKVm3USGNMHFWHjVxIcrDpYrKHJmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TChNq1ec; arc=fail smtp.client-ip=40.107.208.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TChNq1ec"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4Pbb1ivQ7PMkL6FqkyY61PPBEj0Z9/OYpLjkPp4sZR7bne/Z3CXHa4VW2fAaE/bUrywGN6hn0R52RLb9dYEsQLqlbHGXFWwASlMGPvwwmhV+GaFvWALyH5mGe4CTI7KgYmpZU4lWDnYlcgwiMNQaxtCre6fSdzpG1JwVVNl8sZNglZir/Z6bll6nOdRxof7BVQ9YeqYD2a6TwxprZqVxJBwNdp01pQURAYbE9DM7eNcBLaV3Z3ivpfYIiK+5lWSbUONZl5LwRErIH+c/vaDpxOuX1G2OtCtpKVWiQvz0+RFkoRA4+Rn+lY3uM27+bqLPQx7itOsx71m0DVmnaZtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXNDK2k2Fu9bX28w7B4y7poDi3TWtq9cM3lPalyIOY4=;
 b=hSn/i9RKgTWdabrnSczNhxY3w0GvNngr/qln77RUtEWI3h7aZIuf9txttYQ7johb/U2J3xSJHIrMwGc4wU06z49Cg0DA0XdoGG6jbfb5BE+I2aAY5E4bDwxwAafFpeCUpyuOL3WW2dC/RRMrbU0ajWQKHn9OEJfRC2WGcz7hi/IEwZ7pUqFn31P9pQlBAmJV5vqmL+Xlu35AdafQVNIZ1U8XOsSWtPNAt4VFDP2TCwHiue6voQV7nEoDRaeUXVWxLy5YXxCqTlIALA7L0cndjdR4K0XigSa6UmdiekfF4HQqW+qHpwNwRWDc9V29xYTVwiLZYh2wqCcg4P/yPJtoNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXNDK2k2Fu9bX28w7B4y7poDi3TWtq9cM3lPalyIOY4=;
 b=TChNq1ecY9SL7pUN9AWtjWwZsqwS/X86vjI/kN0FBxKUsRlb9uTN0eOmoeBsQARKV1J0pXC0psHOgX4p2ZSZRIFu+gKD+eW0RhHdN5d6NRo0QYgrNrJUUE1KEbl8mblFVFjdOiD7iP1y5ZpQys5TIRyrfr3GlwRk0GLazqpVtHSsVWjNPwhPH7JuHuO9M39R1kjhH3Un5L/PkoEtcx0T4tvQyixvGt/CgWSIlY+iNStLi3YUzLwJD1xlZpj/W5HGwIQN7AN8h60gUGiItzqy5ZYQbfbY70751fBdcQvcrvcc2yJHt6xm2MQgWydCLzi28KTmM9QFpzZxj4rx9ejANg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by SA1PR12MB999085.namprd12.prod.outlook.com (2603:10b6:806:4a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 20:39:01 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 20:39:01 +0000
Date: Tue, 3 Feb 2026 15:38:59 -0500
From: Yury Norov <ynorov@nvidia.com>
To: jongan.kim@lge.com
Cc: a.hindborg@kernel.org, aliceryhl@google.com, arve@android.com,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org,
	cmllamas@google.com, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, gregkh@linuxfoundation.org, tamird@gmail.com,
	tkjos@android.com, tmgross@umich.edu, viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se, yury.norov@gmail.com, lossin@kernel.org,
	ojeda@kernel.org, heesu0025.kim@lge.com, ht.hong@lge.com,
	jungsu.hwang@lge.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com, seulgi.lee@lge.com, sunghoon.kim@lge.com
Subject: Re: [PATCH v3 1/3] binder: handle PID namespace conversion for
 freeze operation
Message-ID: <aYJc42j9bwgZyCFD@yury>
References: <20260203065928.4736-1-jongan.kim@lge.com>
 <20260203065928.4736-2-jongan.kim@lge.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203065928.4736-2-jongan.kim@lge.com>
X-ClientProxiedBy: BN9PR03CA0970.namprd03.prod.outlook.com
 (2603:10b6:408:109::15) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|SA1PR12MB999085:EE_
X-MS-Office365-Filtering-Correlation-Id: 764a4d44-52bd-47b5-6108-08de6364435e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kd1Qa8ZyEkg5UdOJGS3GpZwPqS0OxldhKPMlKuMDX08vHPHsKpPtajtvfs4y?=
 =?us-ascii?Q?Ppwf3AAFbZqhM5XqiZCbF+wR8hDbObW9oXWGcHftLjc+7MIVrhsxoNYFzXKv?=
 =?us-ascii?Q?o0+eV5G+VCzJjLON1NWjfR8t7xg+EwVsEemPU4UVvjJ2qPITaDHhfXeQNvHh?=
 =?us-ascii?Q?Frcp8kObgk2fMLmWDx68SREaZpg5hfeFaOcRN38CALNaYVtr1xfd18dE2lnv?=
 =?us-ascii?Q?ll7P+ngdsWFMKE4BVvrFMDsQvKo0qXLTMuPXiJpzemSh5fNGEdVqwINmbK4Q?=
 =?us-ascii?Q?aNC9a5URbGFPDNdM1bSXxL/BLRebBd+W7SH1SEdWNTbuKnpb9yUwiQXznX7F?=
 =?us-ascii?Q?2esH7LoRMVyibk5SjYPZowWYcjqUSBc5ApkkbVCFyN3LJzfrlx/2cUUYJI5S?=
 =?us-ascii?Q?V1C5syMZM26xHmNh5stZFQDtI8OTnfaY3Neu0cdrLCHVl/sE/7XrWV3C8ORL?=
 =?us-ascii?Q?RU6EUi+7BI05IKcVuIRxMxuDBXeZUiHsTXN9U902PFst6SAg8R8Vtq/Spvcf?=
 =?us-ascii?Q?9UTEf/WhgWnoY+WdboN46kYsqzyiFS1GXfhPg1XF4eUzMh/FSUsQnUVVLZ/G?=
 =?us-ascii?Q?WBiy6kqN59TotHt7V75h6WHKcV0H2cMeL1+nKKhRMRJdx7VCONErygGJwenu?=
 =?us-ascii?Q?fXIy9XeuT+6YSGvImXXg0W4mYVtE+7TBtCIEPW0AGMAC1BfyOo+AimrULm3v?=
 =?us-ascii?Q?eawSpF7xJqIfhtaR611xiEnWQCodt1aV05ZlkTFDk65O91xytk1X+FnHUodt?=
 =?us-ascii?Q?1BFa7xoHxmdkcbYD//gbIKHzQ8hCKte49l7kDvjiAaqzy91ctWzJMr8S1M6Q?=
 =?us-ascii?Q?RBLQ0Qnvzb9i0YQM/cBAbnRmU7LXRvUn6ddCp467lixs6Df/Q/XNcjxz/ytj?=
 =?us-ascii?Q?65twk34wxlgugsOC545EvL7aqKiUYrdYSV2MhPPjS8l4WAfosqJplPBsPcJe?=
 =?us-ascii?Q?85fwBJIlkTAuEzwFPaRp8HnYXefVp3fLc4AB/JfIholQcmN26FMXZyCgHp1/?=
 =?us-ascii?Q?bz77/8oL6vtbQHm3dCSzNSz+1FUtLR/fIkmBnFrzwSIpR1SZxIwpAMJSmEY1?=
 =?us-ascii?Q?KYjwif1+UX2NiCcJJmDgR0TDNzGxqmqAvPTnsTo0n3kQdSrbVtTZNp6tgXxT?=
 =?us-ascii?Q?B2azwGBc86X1xxsP8SDKLDidp4Ihas6LFSFVIGcrnQ/1JXG8BTOnu1piiXHr?=
 =?us-ascii?Q?GacjcJSNdGy3Hjw7Y+5E3fHWgN5aFAOa3bxFnBmS7gjbX2hu5kbHwsVk/pob?=
 =?us-ascii?Q?INoEbcHeiRWU7xZ9GIs9oWhpR/Y2puzDDy+JELyrM86qZSmQSwvrbuhvW17V?=
 =?us-ascii?Q?dM+q+6Wnr2qkDoNzxGOC6d77vEdpoZ/N3F7bRtuvNQbcYAShiGFQ3QjbV1M5?=
 =?us-ascii?Q?64BS3OnyFQUx2o41qbEudgGODltwJSb50BH7eKr1wLC2mHFM1USEPo0w3OL8?=
 =?us-ascii?Q?ynoFTOSS68tUZv02mAmLJRXbCsoHomgq0h+O8+gac563sb9fkZ6x5aOqUOPp?=
 =?us-ascii?Q?aA5gj2Tl0F33gqaz4Ltr8gevSulBlvsZvZux8W8JbcyF+s4uFtbhes9Y8FN/?=
 =?us-ascii?Q?11F+BTDkk6bP23v5kI0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K35a++YFcf2J2NI2DpdhGWJQOy1ln8p4gm5npTUfJlBj0OHawFlq4X+kfxyI?=
 =?us-ascii?Q?aBTUHiiL+o+Z/JBTEX7xRxfBfO5Une73AaYY8bztt0weTPPHom4bxshlm4+S?=
 =?us-ascii?Q?IvrWtKbA5HmYv58bgLYohd5D+2JUpp0trf+39xKZhOgdSWCyJ+XCZPkAW7Xx?=
 =?us-ascii?Q?jcxqKlk5PsvWyVSyN+wNPPuSHsqaA6kFrEUSAXxCmxhMt6YBwNCAMKF4K1lp?=
 =?us-ascii?Q?wBb1fMSJFjgxB7/YW14iMOvMToPTOzr9OF/O17j4pvZPaV/YqodmMfn4JXON?=
 =?us-ascii?Q?xiKlno3m6jXCyqlCElTojFXIKOcScBFcD2eglGa6uoSZUnLMIW08/obO/T9G?=
 =?us-ascii?Q?wzltZJASu5wEyqTfJ+GoPjhMBtElKMbg92W8YV3dy4lP2aRBubnCsg4dAVmW?=
 =?us-ascii?Q?9r/O/+2nwvsLHUHhtmTupZXQqRT6TI6wiiKsVoR+webDUiiqtZQa4ya02By7?=
 =?us-ascii?Q?rML8KxJMP+88QGVUf94pl6gbNL0gwuziIJzLr/lDry0N/nDaFhJoEGLRzEs6?=
 =?us-ascii?Q?n738o78G76eHY4/oZYqj2VxSbOzg0M+hGRQeSCa84+eQjCZrXmKH9s+2tYrs?=
 =?us-ascii?Q?1VXMJsnO2HtEyYh37XwAk2usoNDZwqshrVTfHqfM05sZMh92mBnyuGnsEEN6?=
 =?us-ascii?Q?OBD0ljgg6tPturpqacV+fyEl9aWJdUHpOZV/znPqrFPHXP8N+GV0YG6wpuFP?=
 =?us-ascii?Q?XcJc/YlV/XiD6up1WWOVvQE6v76q765BBBCJ1HlX4lW5qLk3edsx90OHD7Bo?=
 =?us-ascii?Q?e0gSoAauJd1BkEUNrHL6pBvl20bD+RSeL/JGM3ZWfH5noquYkx6JVe63Byqd?=
 =?us-ascii?Q?f9gbPnXZVj5cAcnwBmcYIv98x3aLH2J10ipkAp6qDCVYvgo9RbJnjrms/4Uc?=
 =?us-ascii?Q?svhEl5QJnSc7qnRRla29IcYpXpfrBAeWmQh8O+jf9NVbBxLhbYjhdPnDgUkE?=
 =?us-ascii?Q?kLWyFBEppSxC6ZIyFWf9F1TXXJaYJNv3U952qZnKEbOjsECHG48OAZIbzmOC?=
 =?us-ascii?Q?aiXdGEO5LgAQ3V00btUvk/XRo//bhq2w6xKoGGiH1PFLLoCfiGmRxCTv6exQ?=
 =?us-ascii?Q?VIuRJzaKYE0XRU98fIUgxLWoop4XzH2pL68Exl0iSnNhzpkqnHpTLnUuG178?=
 =?us-ascii?Q?OshVFaTjb4lLqWOcPqYylZPKpQDDzIBYFFGfPo59wY36ccfRFPfLOkxUHDaw?=
 =?us-ascii?Q?crRBf/kaL+gVatnc0v+fpe73zyADy6VeLXUlhYSwIve9ZTWZPdMgmr6N0d8N?=
 =?us-ascii?Q?iibahYcJUkHi6/JEHQ8RtPkJ5LJwXcu8+oAmXQ5X0jX/xOgscSz+8RLznryp?=
 =?us-ascii?Q?AIh9ePAJcJvZLOHMSekbZhaJ6wL0VyqC2D10bdMG6iEfGSyfEcrBrQlTTzau?=
 =?us-ascii?Q?9BKXQb0X6ttVlHipbuHobxxvLeT4+j3muajuQmQatHp4xXzzMzVT/TH0CaW+?=
 =?us-ascii?Q?jJGIgYFuXylZi3AzocuR6QizmsFfjooObG+M0TJ2ju5B6ia/FhLo8zJV5rSj?=
 =?us-ascii?Q?RkBFrPFUvW3yDYBNQa/ef8G8SUoQX6DznX/p2LGTMo2ClKV1c06Z8nsFa4DS?=
 =?us-ascii?Q?FOasAnbiN6BgK9sw1pqPkPP7WG6tsleuplLzOf0mwU/y7WWEms4Mcxl/N47Q?=
 =?us-ascii?Q?PFvHIR7B+51AoPuX0wUOjwwGmdBLIkcwKgIvVrNbbDGPutW+EV3X7kWJUskL?=
 =?us-ascii?Q?WBNodR4dNOfHHlfSo+clDkej7s+LFZiy/kHOyNxEtrhYNqEw8Kl+tCDJyKnS?=
 =?us-ascii?Q?Xac/l/Xvx3kQIBT6fODL0HbQlNV6akSktVsMXLs1Pk1JLN2I6HZT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764a4d44-52bd-47b5-6108-08de6364435e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:39:01.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyAAFBg+1+wWY0fLbTWGbmXS4LLfKQm1amTv2BwU6PpEWf13HZ+xYrkp5i09utZrYDaGa82KmhADArq+NQ5LkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999085

On Tue, Feb 03, 2026 at 03:59:26PM +0900, jongan.kim@lge.com wrote:
> From: JongAn Kim <jongan.kim@lge.com>
> 
> Currently, when a freeze is attempted from a non-init PID namespace,
> there is a possibility that the wrong process in the init namespace
> may be frozen due to PID collision across namespaces.
> 
> For example, if a container with PID namespace has a process with
> PID 100 (which maps to PID 5000 in init namespace), attempting to
> freeze PID 100 from the container could incorrectly match a different
> process with PID 100 in the init namespace.
> 
> This patch fixes the issue by:
> 1. Converting the caller's PID from their namespace to init namespace
> 2. Matching against binder_proc->pid (which stores init namespace TGID)
> 3. Returning -EINVAL for invalid PIDs and -ESRCH for not-found processes
> 
> This change ensures correct PID handling when binder freeze occurs in
> non-init PID namespace.
> 
> Signed-off-by: JongAn Kim <jongan.kim@lge.com>
> ---
> v2 -> v3 : change to use task->tgid instead of task_tgid_nr_ns()
> 
>  drivers/android/binder.c | 53 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 535fc881c8da..4c4366089ecb 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -5609,6 +5609,41 @@ static bool binder_txns_pending_ilocked(struct binder_proc *proc)
>  	return false;
>  }
>  
> +/**
> + * binder_convert_to_init_ns_tgid() - Convert pid to global pid(init namespace)

For global PIDs we've got task_pid_nr(), see include/linux/pid.h:

 /*
  * the helpers to get the task's different pids as they are seen
  * from various namespaces
  *
  * task_xid_nr()     : global id, i.e. the id seen from the init namespace;
  * task_xid_vnr()    : virtual id, i.e. the id seen from the pid namespace of
  *                     current.
  * task_xid_nr_ns()  : id seen from the ns specified;
  *
  * see also pid_nr() etc in include/linux/pid.h
  */

I think task_tgid_nr(current) would work for you. Or I misunderstand
something?

If your "binder_convert" returns something not covered by one from
the above, please put your function in include/linux/pid.h and give
it a proper name.

> + * @pid:    pid from user space
> + *
> + * Converts a process ID (TGID) from the caller's PID namespace to the
> + * corresponding TGID in the init namespace.

Process ID (PID) is not the same as TGID, but you use the names
interchangeably. This is very confusing. Can you reword?

> + * Return: On success, returns TGID in init namespace (positive value).
> + *         On error, returns -EINVAL if pid <= 0, or -ESRCH if process
> + *         not found or not visible in init namespace.
> + */
> +static int binder_convert_to_init_ns_tgid(u32 pid)

This should use pid_t.

> +{
> +	struct task_struct *task;
> +	int init_ns_pid = 0;
> +
> +	/* already in init namespace */
> +	if (task_is_in_init_pid_ns(current))
> +		return pid;
> +
> +	if (pid == 0)
> +		return -EINVAL;

Can you comment what is wrong with pid == 0?

> +	rcu_read_lock();
> +	task = pid_task(find_vpid(pid), PIDTYPE_PID);
> +	if (task)
> +		init_ns_pid = task->tgid;

So I've been replying with the same suggestion to v2, but you did it
in this v3 yourself.

> +	rcu_read_unlock();
> +
> +	if (!init_ns_pid)
> +		return -ESRCH;

You can assign init_ns_pid to -ESRCH at declaration and drop this chunk.

> +
> +	return init_ns_pid;
> +}

Thanks,
Yury
