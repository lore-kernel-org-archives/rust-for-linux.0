Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683635CB8E;
	Tue, 16 Dec 2025 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887312; cv=fail; b=JdUpKjv2qH4KrhzDA1qs1KitGX/hwTRT/zxxIBC3E1r7mmC4PRpgAEJXwrv6AxO8k0XIftQQ9B9xQX9d9Bt8qNDc7GVZcCzpjLEjKCr4fYrjeg3tXqFAxo+JoYo9UNICAC5dY+XYlx6usY11eYRvVd8bLSozCmDAkfx84S0L2fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887312; c=relaxed/simple;
	bh=f5vr7MLjpBpXq558vDQkLj6Gd2DzSQBF+8c0Q4VTA+0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kz2bc0vhGxjmoyRdorxz+DPMQnEc5YLE1wH0Ac2sOpwr//4d1JDnbadMoFIJc/fIxntTQDxzNZ9AgZT6TBBfZJZeqqG42O/VwLu/OTBQ8KSxs74Xoe1yIxdo7oOgLA1b573DDMmp6W+Rc8k1cVfk+GgfbseLMcHlqOP2xVhRr84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ofXeRlK7; arc=fail smtp.client-ip=52.101.100.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ofXeRlK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJYzSXX4F5jyvlyxXs4UcqSGuQFdbGTHyFlKoTLED+IOH2/jNdk5Z+e8E7maORgv0ci9jUPlkbPop0M1dYlQqIQHbA1VpoeUjHDl68gC3mpjW+uDkCUiMcw4ej/+HRGaMrnM7rvdye0dg6F8GY5zms6Lr3gZUB68h0T5AmEhJHVDlOqe3xw+e0IWgtW6PbLQOus/nT2iNYImf7G5vvDHFhAbRpriHxx2tCWqU6nosP5Rpn6hyW8brBKRt4E7UdyVU6dAUx6JKgdYefo4OWisAuJfzpBNlFtOB7UIi+FGb1wefA6aG6Jb98JCCRIse9CkWSf8n1knGYF55eECkBPCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ezof+KHvAiEjxYRtJ6IsgJlooUKZFJEAo8w/WtWB/Ts=;
 b=ylLdPwFwjbWlqltkW5vFNym8z0QHxZT2NsF/tkvM8olI8YbRr1IayrzMEYaiSPF7JtpmwIivo01fTUHIq7dj0olTZHepXPuXDYRiMN5ok8IqN6+fV1ogxC3YjBC1h7q3g4xgYT/k+9qkJOZn8GtL+rxrw9YQVpBn7NeDU/LPyj0QZMIxZPTf9YDtoU8PGi/Rbh1ZyDLGT1PE8gfWRTapGgaV+KDS3FfUr+5TeVRnvce0MuyJqxRkUaLV3B9CeAx2YQrRsS2SqHHQescxZV9A77ZM6yVk+Pq84ye7hFtFW+tlGxctcTfZYancW405vlCZ5x8NtlOJnv3YbM8aepfqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ezof+KHvAiEjxYRtJ6IsgJlooUKZFJEAo8w/WtWB/Ts=;
 b=ofXeRlK7Y+iGLvxRRtVgoxNASJ9Ix8N7WQS41wR1dYJEkr8nVKzdU0gJAjiDM2AM994n9BFge/iMeJn7Xhl7dUV4qLgM2bci/uWNlCbYFK6qVvP8nF5gKH0ZiWdsC5u0TaioOyxwv+JKtVpuiJOxvkL0+QFhS90ywJt2WuCRnN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::14)
 by CWLP265MB5834.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Tue, 16 Dec
 2025 12:15:05 +0000
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c17:159b:10ec:af4c]) by CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c17:159b:10ec:af4c%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 12:15:05 +0000
Date: Tue, 16 Dec 2025 12:15:03 +0000
From: Gary Guo <gary@garyguo.net>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>
Subject: Re: [PATCH v16 08/17] rust: helper: Add
 spin_{un,}lock_irq_{enable,disable}() helpers
Message-ID: <20251216121503.3aef341b.gary@garyguo.net>
In-Reply-To: <20251215175806.102713-9-lyude@redhat.com>
References: <20251215175806.102713-1-lyude@redhat.com>
	<20251215175806.102713-9-lyude@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0191.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::16) To CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:15f::14)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5186:EE_|CWLP265MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb687d5-31f4-488c-df25-08de3c9cbf37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/yVUPsHJKSG6OPfjmvw/qhjohBMsPVVA5sdfv+ydTNpV46f12NCJv2ln1HHM?=
 =?us-ascii?Q?dYOplTy8HqebEkCdwpfJqg6YU8Uk4uVy02PXXXNn8DHKfQIk0i5UkA79xz0j?=
 =?us-ascii?Q?ulYghFvpkDkFd82psF/o8fjRupynnXuHlAev+kpTN/Ars5gvDvZTpZeHwQT7?=
 =?us-ascii?Q?8hLQ1Cbf1yEmMpNmpoA28MK2Uhqbb8gBudSLOHfAcqy1SLhOz1Lhl2kzkSR+?=
 =?us-ascii?Q?2MMruF7r5eZujCbHvBNCMT3bXtmpOVM9QOEhj0u7mhCvOoIiEPF3DDxerzrF?=
 =?us-ascii?Q?1YqFzMWsarEdpHSEC8aBtRVVMFTjGiQb4m4br2/Pog057P1gitqYq8IUht/Y?=
 =?us-ascii?Q?hryNPrBLwl2tRf7zPnjReMBh/OUZwXgtOsZjrbZK/xEWkhjXhkmD/rQvui5O?=
 =?us-ascii?Q?JBQM1uztWBlZuL6ZsORT8vG8bpzgFgv1P+xwDAAVJV/NssXC3ZZOI2XQHI52?=
 =?us-ascii?Q?lVMaW1zSb3NGSNRJmbB9aF1+lnEq7vcz431VCf782Yg/FNkE7LHZqbqt8KKi?=
 =?us-ascii?Q?7xlqIPNFBnHNJ65i5MDVZ2FM2IkxMeHsGYtSpY8vzgDmPHhavGbAY4fSTHJ/?=
 =?us-ascii?Q?2cuzirrI9DLsABq98xtCMU+5PetxWJAbogNAvdMMhJ+YjEm4zKuA54hAf9Wr?=
 =?us-ascii?Q?nAvHm4vulF+wRhyCD75J1v445yCCQVvJ0Es7tPet7LPwGgHBknMWJDePx7Xf?=
 =?us-ascii?Q?qhnlfHkUdXw0AJpl4OexXbJZEJ29RUWAOMwB95lF1h3aAJFGpe67TNw2f6PE?=
 =?us-ascii?Q?3txNas6CG3NwK9QopYotszt5opWS+STmA7+zSH28JhPPvJZTnXj4A1vdZqAg?=
 =?us-ascii?Q?LuwPwLDhrK7uB6JI4UOD62zPfZzllzDKnfcSMIMVPWFBtO4rGD7XKJvG5Lbx?=
 =?us-ascii?Q?ePDalkelcIWd9vz9CT3+7hf7cwbMtOtgNid3xp3/GM5btx5gTBWNHczhyhtm?=
 =?us-ascii?Q?pmYJuqmtw18+s/f5XjxoqqFZ8xeythRPnfnDXfARxiiG5pD4ri1mJSAf+TOD?=
 =?us-ascii?Q?ODOJT4O9IKOttZR9rFjkywCxCYpZylPd1Wdu3acJ4LkfAFljBxEIbh8/4OgM?=
 =?us-ascii?Q?bQc1KFrmkWwWC/Qlq712j+DCqU/NxIhkUzcIXqNcZNzs/Ts+oRfBM8AGocE5?=
 =?us-ascii?Q?Dmkq2G9o9vUQtS9Nlre9wNmj+M3/tng2InQReOlIC6GovtLTC0k36fc8EH99?=
 =?us-ascii?Q?4m30N/UflD89vnzK4hvnzYITYuylDJReFK+aLGzCOqPHd3gMeAOxh/uKr5TP?=
 =?us-ascii?Q?01Ji5qfhLsWMgu7tlncrd9S3sdpodDmjFjejBgsZ5BpymFfpYteljqnyS0Iq?=
 =?us-ascii?Q?lAm+mzmeZ66a2taRfBZkeacrzSwozL/xvrd0K0x4DsdlK8JfeZkuM3bJkTgM?=
 =?us-ascii?Q?bnHZSMzj2eOgtNRzg1rRM0BLH1l0OyZrcaFWbA60eIqK6S97a8K/N6la7vCV?=
 =?us-ascii?Q?KFpMLZVgQXqHs4VDx+8HeQpXJr7kp95x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ymaumsoq1n/p2GrzJ08uQR4jZ3mm5rUTk1IKIAgxdJCueoOsiNzxwrsDsulF?=
 =?us-ascii?Q?iTZkpwoVpmsdHUeDMzyZ9KSps3FBsr256+0j5EOuJwrqP3nt4mmp1yB85jxK?=
 =?us-ascii?Q?2vcAsXw7SG3QX6z9aE69fSw3eDH6qVkipjle20vZn1TyDPS/c2CQpGd4k2dF?=
 =?us-ascii?Q?sOocJnWd8z4A/falTnmRPvtQr4K5B83oWjnv08OTnmfjir6AqESuYpP2fUc/?=
 =?us-ascii?Q?DPfQmsKgeSbz5Ng2U99GD09T40ucNdHVfQ10c53b4NE78IIqz1G2rebJO9On?=
 =?us-ascii?Q?RWQwxGzouT9bWkYOMmSAmj9UR/8JfnDuUrJNS7wCP0u+uO2MCzXEmAxDQUp2?=
 =?us-ascii?Q?fbiS4oZANWC41NO6ShjnXOBz1P1FvPDfL/eIKugrFt2PSE9E85kdmzuLaTQW?=
 =?us-ascii?Q?tH7cwLyF1rUAWhfa3PWtdnexcKI/UDW7x91781KsAY40hNgEUhez91WvKfQL?=
 =?us-ascii?Q?mwigUIPe7bkqn3+4x+isl5QWem0ztHr97MSNc+tbXxuADXEJLwfFkk7sUGxR?=
 =?us-ascii?Q?j8x41Vmp5pzgcZ8slyPCTpZ6q/IxeDXjRLCmRINbLjUjW9Y0Vs0PsodSzfRa?=
 =?us-ascii?Q?pT2oP53TlrZThNMoR5ZE0+c5YKq9YdhEwhF/PBzPoCgY+XGGtj379mSsahYt?=
 =?us-ascii?Q?joe5m2G1NS0/C1eObCx1xVMeZGUSYoUKzdERYJV0KQ/BiycAg0934QsEyZtq?=
 =?us-ascii?Q?XCvxVQQYHnE16FR7g+T2KbCqQRtEHS50mbNjEBNf9LDz0m3aZqiLg81HQlpN?=
 =?us-ascii?Q?5f74lspgR7YnJXit1VMdyO1GIhIZ5BZ6E9BPTBhrBgc+bB3cvr4vjXMLDw7w?=
 =?us-ascii?Q?3ggsh7DzfQJgHmfBOV2SmZZ6dJjoMWPlFwpIs9Jw6+0NZEecYcFUIyUfYtTm?=
 =?us-ascii?Q?BDnMcg8XTDQG+GZCS76jFai8Ze3cdAJ5LhcsoL1tR8UdxXKMVOOt44t/7UHd?=
 =?us-ascii?Q?3/P8O/zTOOkQY+iIvuTeugjGgsQduPbHC00mCBQzR5OfSRy+zbDKy8G4M9V1?=
 =?us-ascii?Q?9imeYNtuH8J97Q49wHYSvUpo+jgInnnLr802+gzlHJOTiOkZygZj/iuhq/mO?=
 =?us-ascii?Q?Ff4KRje0sKusc6cwaI0KDOxnMbDGWMZNMvz732hX3DU0dUxnPET3HDT3/B+H?=
 =?us-ascii?Q?sFEEH6lBFbrCMw3gWz1vel4a2fyyLFuZUkK+9zTETShL3RCaOxdG4CaIG70r?=
 =?us-ascii?Q?RWne4eYbREp55JcPyK2P6qMcaV4oqbuxGIPhibg+UjUNSyk13t0w8ubLmGOc?=
 =?us-ascii?Q?M/XQ3lg5o9wTCmeA77ShDB0sbO0UzS0tJp9eWQyWlxAYgzWnOjG8c9HdpAUI?=
 =?us-ascii?Q?O6JPn12NgiSV69fSYvHd/eguh/Gj9mn+Ze//OnuLNnLCpw0WR1R1/F8UYL8g?=
 =?us-ascii?Q?fWjwMkRzbN2fKJ6kFWJwAxYakWYJkp7V2ECXS1J9HXPnFqiAsFSVDqpIjKv5?=
 =?us-ascii?Q?YR02rBgKlcrE5rrE9HpezI2PBJDqKDhRNSvGS0e61tvmTxApk4/IgmCVksQl?=
 =?us-ascii?Q?kIktVl2FsO+g/zmX5hZgQlUYnjbCml3PvR6IvWPi9biEXduhcMsVgjOd8O5/?=
 =?us-ascii?Q?zrzAD/MjzhCnDQQf3yjhgPK1wPSwZRajZkhxJptM?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb687d5-31f4-488c-df25-08de3c9cbf37
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 12:15:05.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZU8f7BX4Jeek1Ew9beBByrw5YTE4s2MsIHn5Aj2ZQF/4gxP6eiBgmKmDgmT9y7H8i4FGlbTnYqLc2M7XbVCJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5834

On Mon, 15 Dec 2025 12:57:55 -0500
Lyude Paul <lyude@redhat.com> wrote:

> From: Boqun Feng <boqun.feng@gmail.com>
> 
> spin_lock_irq_disable() and spin_unlock_irq_enable() are inline
> functions, to use them in Rust, helpers are introduced. This is for
> interrupt disabling lock abstraction in Rust.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/helpers/spinlock.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index 42c4bf01a23e4..d4e61057c2a7a 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -35,3 +35,18 @@ void rust_helper_spin_assert_is_held(spinlock_t *lock)
>  {
>  	lockdep_assert_held(lock);
>  }
> +
> +void rust_helper_spin_lock_irq_disable(spinlock_t *lock)
> +{
> +	spin_lock_irq_disable(lock);
> +}
> +
> +void rust_helper_spin_unlock_irq_enable(spinlock_t *lock)
> +{
> +	spin_unlock_irq_enable(lock);
> +}
> +
> +int rust_helper_spin_trylock_irq_disable(spinlock_t *lock)
> +{
> +	return spin_trylock_irq_disable(lock);
> +}

Can you add __rust_helper prefix to these helpers please.

Best,
Gary
