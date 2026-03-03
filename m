Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22583386442;
	Tue,  3 Mar 2026 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772524725; cv=fail; b=sjtDBH7GxBheiRzIaap0laLZrxrjTud1o7XeQbmYqQX1O0FBKxpuEFADXFzgtC2D3MAKHlMRfqih6G8yxRYrS1gx0IlKGWO3yY0/OtIJn+CF91uYA5KC8xzuZO2JxdVNwMuvTLz9phueBaEtbfSD7DZxnSxm1CJ/N8n4pLOvLdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772524725; c=relaxed/simple;
	bh=9+B4uEidWoF62vOaGjhCLsoAB54vs23HEm99F4UEWt0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Tf943cz+AaBbaQBm18IHs1EvsqfncOOxeRtv6JkG4udvlGtwKicuWL9OngWiZAYKLPY6oPU2+HPlH2p+Buiuq6liNwmeixUhRu84F4tztASpb/ER8zTP3glFKpengDJY/apKcnEvvQOn/IMCN2g5jNDe7825q4xlP/wxLPqgYfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tbsSKUf9; arc=fail smtp.client-ip=52.101.62.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tbsSKUf9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss+6OZjM4Dox/A0EysMsEcZiq6gjmq6sAqGS22m1YLVcYojmKttse/j6MmSRm9xf4T288B647gJusQEMpgO1FzyprVCul8yzfhsb8JbwnZgyk09oR7snoqpybxPxPN5tnP0m1WJ5r93oH3fjSdPp0Qoqder3/l3r9273VZV4pksZdieYU1vz+g3cnFR/tlc6NGdWSfRaz33pTbjRKXPSakmcVEg8dv6eqPuefaZdPBTAnGNSVaT+Zf76fSfYQ8B5Tllp4s7Sveh4QzVRK7WpcK7TES55ogLiMijADRwoKpMjlqEGmhlKdThzQBqjql8G/codjX3XgQxDku36kcrnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRMFMcDTLBe5VgB3E6uZo3olcUVDRJbo4Bmz4yfO6Es=;
 b=QfKPdKxKfblC5tedcXcbnwRf4w81B0DzKTBZ/Tsk5S3Weduq3ecPpT55eJc9BNF4QBLp7lueXS/n/nrarkdhCp+aGJJPLnWELp4hxwsCd0NwA6elzfKyRwLzodLPD1be/gmWgC8lwhVSwozVb2IvMHtthrks5Umajb5OyNAg9JPZ7ZO43i7+10JfUIehpdxkoHFV3BLojMn3ltoastVRHbklnkzul28SEBVC5oFah1yt7/IXespAONnEKba1CKIYAFvG/5z+XAaRqWxWtky2G81aHm3fDq56zKbO/T4HtiT5hEJOWrXaw/R24F7dLxZdfflEsJGqSUetmzDbKZDsEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRMFMcDTLBe5VgB3E6uZo3olcUVDRJbo4Bmz4yfO6Es=;
 b=tbsSKUf9b7M2B9YwSAnZY1lwFFwd0G9fzq3z/RbLAI0Gja0ekkUSVSvaephP5DdMV+IenQ0f4WjvAPFrP38mnlBOyGwQPYZQNxBvpjwDHYC2qpW/kCO9qtd2YOcYDm6Xqad2OMIWMDWN+tSVl8ptUN2V4JqOBkaMq/APoSZXjTFkFKzZMIVy+sNlJCo82H7oW3wWPykhWFnQcp4wozt58mLWcQ2b1vnZXkb7dQZjT3dveLh0NjnvLH0OVYwh2llU17jQ1tGR6LuiNjKD8RpjPRzylwLVt1Dyu8s6VsMkofJrFex/DAldI4Z1dQO4ljcUjEgnFHx1+HJAi/nYYAXWxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 07:58:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 07:58:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 16:58:36 +0900
Message-Id: <DGSZKLIZVKH5.39822P7Y85PUA@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v2 4/4] gpu: nova-core: gsp: add mutex locking to Cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-4-c7e16a6d5885@nvidia.com>
 <DGSH8LCY1JT6.2YRPF2ZO49OCA@garyguo.net>
 <DGSU8PPHDH66.1QQ6N7H7IMP7W@nvidia.com>
In-Reply-To: <DGSU8PPHDH66.1QQ6N7H7IMP7W@nvidia.com>
X-ClientProxiedBy: TYCP301CA0052.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: f6030f21-4858-47d4-b17e-08de78faaea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	Q+Jn6IUPLue8jMts9kdIf2D+7W4k8rAj2rdtoK4zCvjRsPTjATRmBJ/+ja+d0lHEIr88EiIyfIKIwVRjeqmxdBnlh46NMvpXHKlO50xSpBVqHjlIPz810tR0hgsKL1toZCdybPrAqjZmd23HyYVPRdGoyBzCfw//hIb50qEwQfed6EGvCiq7dALtgsfbEKsafDj5xfHfhbSdfDrr1gk/ipUR95piX0QD6ImPyKQqo+7++7/ecIQ/TaTIepKdUWvGiBJ5TetY8FJVB+M3PYuXFmVUW/FQZSQJRVa0cDl5SzohTbZtL6bB/Tpx+jLjpntwcrPiLG78uUQBla9x5QX3a0XD6GU05QGlTP8JD7bYMPhRLYjTtC15eqss2TFAyOgZs9XI+LPgs7MKvKVXdUGMU/gJQ91iqaBZxgHRuVtNAX6/Vslp/c0iBArrbTdOpl/VLLT8wbusPagrV0thg5Eli9LMwNND4jUgGGnUsChk/+R+KV0u9kcCVVB2m12cC3iJBoH7TM219vC8M2KSn7r8rlXYAbjtWg7ohZh0POfv6CEcCejGEppsnDqRjiQ97LsmSbVJWyQxKiG7OdwnNK5AYtmyRqJvIHxBUUGG+i0pHu5H648nD3HvDZ1artswfU+GEUE/QAqOteH743nxVccGU25OIOVLZJmzRJ4NYp9Mlz3vctdwUEu6MA89TiMIU7dkLC8SHvmL4EsewxtsgHTmSpsueBl3tZG5CqHz05GcQL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFdoSVFGV3dxY2Zhd1QzZnF4cmdqTVpYTXlXVmpjU0JPTUNNcUhIdExWWUdt?=
 =?utf-8?B?WDFqeXlHRTRZcVYvbld1cDdkMFNBYXN1eG9oYXBSYmxYams2ME5iWmVpd0R1?=
 =?utf-8?B?RmFQY0NhU0tPeWE5RG9DeTRBMGphMWlXMlhqdE1hMDJHR3l2bDFlSlphdmgy?=
 =?utf-8?B?eGpKc3d2WVpoV3p4bHI3Q1g0MW9Wb3hUTjBkL2lHcFR4bEphVmFhWno3dG50?=
 =?utf-8?B?SEQ4czhQQTltMnhxanNNcDB3N200ZHFIOEt4M0J6clVaSVY0YndNTi9HYVlu?=
 =?utf-8?B?amFEMFNsTlpVZWJXWHNvZXcvQ0lGY0hyd3AzNVRPZWhTSmZCWVlsRHV5K0J0?=
 =?utf-8?B?TnFlL0d4V0U4OHM4MTN6azNsaE5FZW5jZi93bXJKUEUveEdCa1UrUGoxbkF5?=
 =?utf-8?B?TUNMMVpzbmdaV3Bmcm1JZUthVzEyOHJuaHpRTndJMldFVm1jTHJCZkxTb0Nk?=
 =?utf-8?B?S29yVUVvanlCZmF4RzFrcVFKWVZUdVNjOUFPaUx2NmsxbmZFaEVxZy9CWTZ6?=
 =?utf-8?B?Z1ZONUtPTGJvQVlheHdobjBBVTJKTllXR0tSOWwzUTFUd0JsaGFLQ3lPN241?=
 =?utf-8?B?VjBjRzJNZWZnU0FFVWN3enJMNUI1d2JQODJrK1ZsbHJzdFB3QnZwZGdaT1Zm?=
 =?utf-8?B?L3lJT05pNG9GbldiRmtIUnlPcjU1Y1RsNFVrQndQZlJhbGwvMnN2SFZWWFJB?=
 =?utf-8?B?dXVsanUvVzdPOHpoUG1qSXNQMmRaL0IzdEJLOXRjTUJoVm9SUmwrbmhiMm5G?=
 =?utf-8?B?RDVHMCs1ZXhjQXFTSzlTZ0xydldNU0g3d2RycHkvc2JjbnFIc2JmckNqbGFD?=
 =?utf-8?B?bjVxYVBTYnkvdDRDWXU5YUtrNWdhWVgzU29hU0tOTzdFbEIvcENhZ2pNVWVE?=
 =?utf-8?B?SndjZTNXUEhWR1U3Z1Flb1M4WGVnUENJVHUzK1RlR3FNUWZ0TUZEV1ZuZnh2?=
 =?utf-8?B?NjlWRzgxQ0RVMTBpVHZiSENSMmxoZnFHZCsrWGdTUHRBYXkxQ2txaUM2Rk1x?=
 =?utf-8?B?UG5MY2VQTmhTL2VLUndkVWdUUkdvQk9rYXlYRXMvVDUwYUtKZDVKTUVjTTcr?=
 =?utf-8?B?THhieWJqMlFDTW5OV2J3aTNXbDJkTmFmbDNodjYzbXZRWk5UTzMwOEkzb2xS?=
 =?utf-8?B?TGNreUlQb0RxQ2J3SlFjMUdIZEZlSzJ0emlCRVd5SGd0SXVCQkdKV1ovU1Ro?=
 =?utf-8?B?Zjl4QStKdklLS0x6eU52b3JiWXRhT1JFeE9uSm90QzBDWE9yVlY5V1Q5ZHRE?=
 =?utf-8?B?d1dZMUtxQ2dnVVE0Zzd4cXBjaTNZa1Njc1NRZnJ3M0dreGxEcEtQZDg3T2Z1?=
 =?utf-8?B?OExyNjBsdFBaVXRGZWoySkxFZHdPSlR6enVrWFIvRDBZellrVXMrOEFtSy9N?=
 =?utf-8?B?dUE3VzRPSXo2U0piMHIwSWx6MXJiZGVMaENhYzFSWmRLTTc2U0c1ZGdIbWJT?=
 =?utf-8?B?ZDJ3R1FOTklBeTV2Rlp1c2hLU1A0SXRXYmVEVm1zMXA4MFY1b1dMODNvOUQ2?=
 =?utf-8?B?OUFyanRFMDE1ZlZHVFFLSU5KS204Y0hldXFhTGFZZ2owWUd1YUtJVHQ3cndz?=
 =?utf-8?B?d25RVlBKZ0hLVUdNYnFjM2MxNlZTb2xjUjRtSXY3VmNFek0yWEJkNEhJcjFX?=
 =?utf-8?B?NTZLUFNwTUZpYnBuM0R5V1doWEJLUDlrZTU4U21ISWFMV2x3R2R3Zy9uU1Np?=
 =?utf-8?B?TkNpTllLTGxHZktGQ0VncllrZm5jSEczZjRWdEJBKzRZVm9wQm05L0c4T1Fm?=
 =?utf-8?B?US9FWkxVNGhTRDhSWWZWR1BMd2Y0NkM3My9kTWllb1BaTjlxUXRNVHErK0pQ?=
 =?utf-8?B?WDZHNDJrVlJEWW5sQTZpblJWNnFOS2RBNlNzM0xBM01zM2RJSWVnM1c3dUwx?=
 =?utf-8?B?UXB3V05QRTJPYWxmZEZNSnR1QmtGNWZCdFVGalU3MTgwOHRJaXc3SmJQbE1n?=
 =?utf-8?B?SzVSU3ZHWi9YeGtsSjY5NGg4aHQvTWZndmpvUWFScmgzSENEUGVBZEloL3hL?=
 =?utf-8?B?R2Y0QlEraWEwb092UFBrOGNUM2wzc2JQdjFweGNiR1laQVRzKzIvbTlRb2RK?=
 =?utf-8?B?VkM3cXdLY2FEVHR3c3RRdk1XS0hxY2xNRHkzTU1WNFBPMkVEejIrKzBQK0NO?=
 =?utf-8?B?TU00UVpZZStwV3BPdmYvODFyL095dkVzWFE5YU9SdmhOZlM1TnVrdUtjU0dv?=
 =?utf-8?B?dWFmTmRTdWtURHE4cDh6ZmZ4bTZyMTl2S2wzYTA3OG9QMHNkSzZibFpsVjZX?=
 =?utf-8?B?eWljMlhSZ1RFeWI0VVo2Q29HSUljWkVkcmNrOTd5YVk5RWJ4ZW8vUXJCdGVF?=
 =?utf-8?B?L1lDdkgwSGRNM29ITGNZRFk5aVhtcmNzWUxqaW9EN1FzMDRPL2VHUzVCSUxO?=
 =?utf-8?Q?9wvD51PwkwLeynJLgOYhgCfIeDNvcIgY6kKUfdg/WWK19?=
X-MS-Exchange-AntiSpam-MessageData-1: vk7Ui9P+ytd2tg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6030f21-4858-47d4-b17e-08de78faaea6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 07:58:40.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baq2jTbJPOYDu+79PDTXnOInDVO9NX4b/QNDCZFqDNM9aRjZwbQxyNUU5rDxuMKvtpYdsuXxwuoBXNRUNeVK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769

On Tue Mar 3, 2026 at 12:47 PM JST, Eliot Courtney wrote:
> On Tue Mar 3, 2026 at 2:36 AM JST, Gary Guo wrote:
>>> +impl CmdqInner {
>>>      /// Sends `command` to the GSP, without splitting it.
>>>      ///
>>>      /// # Errors
>>> @@ -540,7 +493,7 @@ fn notify_gsp(bar: &Bar0) {
>>>      ///   written to by its [`CommandToGsp::init_variable_payload`] me=
thod.
>>>      ///
>>>      /// Error codes returned by the command initializers are propagate=
d as-is.
>>> -    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Re=
sult
>>> +    fn send_single_command<M>(&mut self, dev: &device::Device, bar: &B=
ar0, command: M) -> Result
>>
>> Any reason that the `dev` is passed in everything instead of just have i=
t be
>> part of `CmdqInner`?
>>
>> It appears that the `Cmdq` methods don't actually use it apart from pass=
ing it
>> to `CmdqInner`.
>
> Not a strong reason - I originally thought it would be a bit nicer if
> CmdqInner only contains what we actually want to lock on. But I think
> this way is good too, so I will update it. Thanks~

Right, when the only purpose of passing the `Device` is to print log
messages, we prefer to store a reference to it to make the API simpler -
other parts of Nova do that.

If we require a bound device, that's another story and in this case it
is (so far) passed as an argument.
