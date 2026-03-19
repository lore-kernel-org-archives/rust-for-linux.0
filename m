Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A4D19309C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 02:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773887329; cv=fail; b=Fs8ZEm20NzRf2vnmcvjrAFxPH0qot2XmcM6R53tw/afG8IivaycEbWLCPAQO1ROShjYQbZCsWaraU1oJ+yPmmDoJz2BNVcnQ1X+PWShEUnEnmY99sXGCqdspKDxgvGbtOAbfvSbMvP9kAxWlosUQCIYbyUzsiKPQV4YN62N53xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773887329; c=relaxed/simple;
	bh=6YzoOecYchk3iG+d50pjYqSJXatmJLyvqfypVFxRZ1o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pGITU6UpZE6qatJCM4C68kbm9ZuTFCQwKkOLjI26UgSotq2gDS4ULCE0ttcyyHTv9B046I1tY7MWuEGrtM5LStsr9c6eU0p9afmQIKBJzJzgKWLZfEjAxywRZhPb9LqIjCxS9JkldwwFMqL3GV20wo7I1gVY0Tahw4Mve3XbA3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GnQpkspc; arc=fail smtp.client-ip=40.93.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GnQpkspc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwVR/N0yMUENIGEoxTtjSbi5j/ySYE+6mHBnjhWuYogF/4+touVytBOz+J2jYxj7hrhU1rCtiarzFopuQvaYCANm5kShCRLlPCYlA8ztTXm40nhb/xCBwObGL+1fIAvjBk2CCYu0hW60uEBU8rrNMoRrYyYH/0JB+YKNNb7ObYlN+ifgljyLn0NWpO/7rHnUAUr8tAkDuwf5YhP+qKbR3qReB3FxCgSmYSKiSUTT3Al4Y5h2ADh5njS7N8iOXBYNO3A5BPRIgMm+PbdO04C1AUrqE2akK9Rk5z5tC1f9iUoOzQ4ahxQ9oyY9QMqV/1ba4ugetgpM69X1XMlAkeOrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZFf561v3wmyjvSAj+tgm97WJEZoszeYQcw7J7ceRNA=;
 b=UE/+ldu2Cvx2NTIpPW9yM1GuoqB2SfgMP7i3NPIYg0Bs0McUg0OlYewkVy2YkcOetKzHqLfwPdR6tTfzFvUbt44smyK4uIu0Plc28glKSr0cTmvfju5Pv3Sf5uf9lJhsv6uUhR4kAs999G/4zBSH9kPAmFeg1jzytEkRrjolExpQ2RcRuBU0FITysVK0aYSaQ0m4iv/SBHIs0bmi/meCbSwrJlkhN24RqqhMFhPsqO4IGSbH11NfQYLxYPgY3S7gWnGMUBNDZT2/HS6MFFLou1f+agBUsHBMZge/m3aJ9n17ZTOz7Zhv/Qh1qq63Vgl2NRUdxb3XFEyXTBKvcYERgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZFf561v3wmyjvSAj+tgm97WJEZoszeYQcw7J7ceRNA=;
 b=GnQpkspcqEY7gCut3nuSzFDymacWkZ4zh1dc1fsBI6J0LVHYdh8SYK8PnlAc2cp3r04cyO11W1oEwZ9BEA0N1jacVWjLATpbAHQ5czW3SzGnybKoV6FVtIm06DFz+NQi8u9WhglT4XtWFo+L25zW7m3MiPkftEf0eozbvziISVKUz0xURjR0OkWQ/7QDf3eq5FyIR4RBiFvTe3qAdMMlAumg1558vWChone7bqWZuG4gNec7vhfOVMkkkUtfx817aDTzt/1XF/FdFzTcWhGbHIuffJ3MewG12R+lJ6b8gWfF0k5sajTwYE5c6FSOyOXZn7/YfsDx/StColl0xo1Gsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:208::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 02:28:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 02:28:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 11:28:42 +0900
Message-Id: <DH6EKPTX3M0Q.Z1TLBFDVOFAF@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>,
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v10 0/6] gpu: nova-core: expose the logging buffers via
 debugfs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260317235403.1094713-1-ttabi@nvidia.com>
In-Reply-To: <20260317235403.1094713-1-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bab609c-2955-4d00-b3dc-08de855f3e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1H8of+fAt49Uzmyk3VwYjbDzSK/ISsnSyUZI7EfT4cFWps8rO3CXauIqgzbuJbqTQXh7wW8+xLQwilJLaXeL5/RjRvVB1pBCRS/jZGyQgpnH8k9pzOOz9hlR7hfU9UznpvAI52aT4f+FsL+RFlucbCSSnNxJdUjLiPN/9KFl8X7Ssmw0o4+A/LifnjclHZlpskJBBYDvQyQU62a8xnC60BQRQDh61Dv1F1W7pZcarXAJf/tH6mJwdXIrqJjvAxDPnV7mhUisjVgfzvMEiAHtKCwOsV//4J+vdxiicBQP7qd/f3MB0ZJ/bmJAhwPQ9kKqSW/GnA4ig+L0xESlxlzcWphY4aQhVsQTRn4XuJ1zEu47mc3hsH8/Bsb3VPPslDG2Gg4070/LaifhDL9jKyMJvAoTpcAen4vY4dPyukL0fhtK8vJXUpo4fDtOHnHfIpCMT/Va3/VKHiktWSYDHulSr6ezdHLUNFzpEzxC3dPhit7NXeDQ+yLvFrvz+qQWJ1QnsZ8zeNOlVBzy4PMZubqF88xnuN2FXrvPkCCSYzhmH/id7aKL54XDcBZutouqsrZ+lddqqj/PNoeKFdThzbz2KZDUcFnKTNsLl+k+PrDkSvGBbX38klfvupiC9+y1LH2Hw9ZY4tIctbQ2Y0MwjhlysVi0POyDBRt6XTCbMWBJc1C8TkcXGqnRjickBi3hAuscD2lhTys/fNusCl58ZmB94iLZFQJ380TL15l7Lc76fKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE4yQkUyVXRNRWp4Z0hsMmJScTVFd2p2NHpDeG9WUDRna2FadGh3ZHcyZ0Vp?=
 =?utf-8?B?VkpFOG04U3g3cHVGdEFoSDk2WWxiaDRVVmRySUpaTjdrcjBsanU2RStqOXVw?=
 =?utf-8?B?SE5ySkZJQUMrb0hzaXd5bkVkWWxna210eHVmOWlGQmo5bmJWUFc1MUZ3ZEh5?=
 =?utf-8?B?N1MvYnpxL0JnblNrVHRHekc0NndOaGo1NmVDTU8xYkNSRWxHYWlLcFlKK1Jo?=
 =?utf-8?B?d1BvU0M4dFBkOUtmUDhzU3VBT2ZjcEg0TUpYckliM1hIZWlkUUhmTDdaN1ly?=
 =?utf-8?B?QzZUQVZ3alZJTlgvaWtiTG13QUlhcGUvOGVuQzdKcitkR1JiSE5sOGM4UHBz?=
 =?utf-8?B?L3lPcExaQmJjWEVEZkMwR1RCTVVkUFBIblJjMU1YN0hka3dGdkkwcWFkeFFo?=
 =?utf-8?B?bXAvOW5RSlhBNHhhRDFmZHNrSTRoZWRXTzVCVmNxT211K25OY1FCM3ZVMXB5?=
 =?utf-8?B?RmFSOFBJUkpuUDIrR0E1dTFYRXgwMVZDVVdILzFFMjBsNzZGRkhHQkFkTSs2?=
 =?utf-8?B?NVB2UGkvZERmWitKck9xZlpKOVhZeHFsaGlrYkxGV2xCNC9lVUNzYWxkUS83?=
 =?utf-8?B?QUNwcGJrbmo3dEQ3R3huanQ1VlZBMm1Ob0hLVFgwNmgxd21kaXB1TWZqUDVK?=
 =?utf-8?B?WEszbWI0cjM3VU5meXowMmNKelJQd2E5MDNVVlUyTEJYdVRPTzZzR2xhM2Jv?=
 =?utf-8?B?eDJINDgzemhYb2RkbmxKU2VGQ0tNYlFaVkF6VlV3MU1JWFhqU2hSU2lZZjRP?=
 =?utf-8?B?dFVMcThEQ0dkSUVJN0VEOGFhTVUxNERqbnpvUUFPcUU5N0dFYUdEUmthRDcw?=
 =?utf-8?B?ZlAzbmVtcUt0aEUwOXFjWUd5SFg2Qy9Xc242eGJ0WUprbEZaSUE2QjVpcXJQ?=
 =?utf-8?B?ZDhRNU8rMjVoZ0pwQUdhZUNZZnMrRlVuL3RTM0JFejBSNGdOb1k4UE9sbDA3?=
 =?utf-8?B?NGwzY0RVdmpmUXU2eXFIZEhQK2MxRkZSV2R1QjEzclBCMzlhKzRMNUZPaTl5?=
 =?utf-8?B?YjUzSEdHaWI3dmF0ck9TMnhkYnFhYjgyMXBrWU9CTnIremtMNkdlcVJ6QzVp?=
 =?utf-8?B?eXNrbVcxN1BsbDl1QUpiRTFWSXFMekFJd3RidGQvdjA2dHZKY2ZWeTl2UWZl?=
 =?utf-8?B?dkY4dGZsT3JXZzNma2ZkYWNYSFVYRXhPaGxvTUVGd2FBcURoVjhBOVBDMTBU?=
 =?utf-8?B?SXdwOGJMVS9qRWh1TmFlUkN4UWRuSkY1ajA2MnVmM2ZrTERwTWVPeUwvVDZk?=
 =?utf-8?B?YzNmSGdPTDEwak9YKzMxeUFvaXEzTmNEaW9LWGFFOVFhNklRZ280TGtEWFRi?=
 =?utf-8?B?NFRvM3J0U0lWbk4xWVpZakk4a215Q3ZlQmh5R2RvV0Q4VHJaclNMK2hkcE9U?=
 =?utf-8?B?bE90OVdEOXRneGtDUlVhNmN6aHc5UGxqU1Z5dGVUV1k0Skg1YTFNdXJFa0hN?=
 =?utf-8?B?M1dlL1hUTFNiVFhoUHFWbTBCUzBpK1lEZ1JHeG1PZTZ3emwxeVYwYk9EbnpR?=
 =?utf-8?B?aDFwTGRCSlRqVDZkdkIzNWRKcmN2cm5Na0tpYlo0WnlhZmo4bUdvNmdJVVNp?=
 =?utf-8?B?YkRiTjVEN05mblJoZkE3YXRwaUVzdUJnSWlkek1oUUdkZlBGclJadEZlclJW?=
 =?utf-8?B?ZndNMUFyV241MTlzYTZ3ZU1iQklGMGQ2SElSbWNYYklKSVNDVS80c2YvZ1hV?=
 =?utf-8?B?Zy9GM1JEUXVIS0VESDRBako2Zytab2w5anAyNzV2UEI5U0pkS2g3ajlYN2dE?=
 =?utf-8?B?YVNGQ2RMSVpxYysvYzVYdEExb0oxQzlEUE5lK1JqL01nZWJ6dEY2UHlRT09p?=
 =?utf-8?B?NmdGRHU4dmZjL3gvejVaeHVIMHEvdzZoRzJkOTdWK1N0Qi9HaE1FazE1VVlI?=
 =?utf-8?B?MUxpMnUzNVU4L0tEQTR0a2M4TFNlYkRueFlEbWxlbVYvNnNsSzBFYnFKYjZv?=
 =?utf-8?B?bTFGbVZXMVAwSmJvbTl6NnFUVFRFNklEMVlOS1ZTZ2FIZHhqdjVXTWtSVGg1?=
 =?utf-8?B?N3hUK0JFbDk3dWRSODlIZW5CaEhDemZ2RlR3ZXgwcndpU3lGYkhzUXBwVDJL?=
 =?utf-8?B?cHcyOXdMYlRDNE5UMmRURXhCV0JTRGQrVStuRStJSVpvbm4xNWVtQkZTTGVT?=
 =?utf-8?B?eWxBZHRiTUpFeDRiL0djeVBLeFlrREljMCtHK0cvbXNmdnVRUklCSWVhN0tE?=
 =?utf-8?B?eXdwRmROQkhxWlVGZmo4RjJkTlBBajRhSS94RkF6M3pxd3Z2WlR2VFJTcXJE?=
 =?utf-8?B?UHBwS1htUEEyRkl2c0xHT2VjMTdCS2F5ZnhkRWJhMHlNdENLYzdKKzBCTXRu?=
 =?utf-8?B?Wm9uclFyUjE5ZVJEMXJPMkg5Q0d1cnlPamU1OWZVdXVzdnFmYllXQUtlTFVl?=
 =?utf-8?Q?7wRYfUIJjkSkU23tHHsjE6M43hj971gUFsFyk7V27eOFB?=
X-MS-Exchange-AntiSpam-MessageData-1: 389FF2tK3I7UFw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bab609c-2955-4d00-b3dc-08de855f3e92
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 02:28:45.3082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFYWk50ArHU3A3+xzGH/w30fWcVRtbPwe39a+2Foj51GJOkiB3mfzofjWaacW1CVDEpwQ2TxwSkuRFPwsyhLDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000

On Wed Mar 18, 2026 at 8:53 AM JST, Timur Tabi wrote:
> GSP-RM writes its printf messages to "logging buffers", which are blocks
> of memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.
>
> When the driver loads, a /sys/kernel/debug/nova_core root entry is
> created.  To do this, the normal module_pci_driver! macro call is
> replaced with an explicit initialization function, as this allows
> that debugfs entry to be created once for all GPUs.
>
> Then in each GPU's initialization, a subdirectory based on the PCI
> BDF name is created, and the logging buffer entries are created under
> that.
>
> This series depends on Eliot Courtney's Cmdq patch set [1].

The series now applies nicely by itself on drm-rust-next! I'll let
Danilo coordinate its merging with the rest of the I/O related stuff
(hence my Reviewed-bys on the nova-core patches).

I think it looks great now, thanks!
