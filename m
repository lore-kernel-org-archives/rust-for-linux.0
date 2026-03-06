Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D692DC35C;
	Fri,  6 Mar 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795444; cv=fail; b=ZxupGaYnWN9i30Pk+DPS0tRDulY1HN8hRGIax02K3Oyk0jCsAja61NBZNRv68Zd4aZ5neMKuJVWD+Tfa8cKR3sJPoWCu/2+MpRdTDy7DMaC87oMMXM78E5eAnpiZNAa2LgbF9uzN9Jh1lZEbcAEVHrhyzrC9xvx+zXNGZfyNadM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795444; c=relaxed/simple;
	bh=tiPtBDofq9iCOq3o6XwyjSl5BDMC0d5YxSA+Z4HDuEg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=cqVxJHTQ3gFVReoXQ/744M4MXrcgQZsc6Rh7BO0M8VLp7MFoxkAhCx/05Y+04NPaC/olovqDOuFcSyjVWdvMmYv7Xnog2DSeNP3SHX/YMhSVPeMWLaQZaK2o7oAhDEo+RAhPs4bBCvVBGozwKdKS4iM3ELtrrxUES5wQYoRdIQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mt725Zh4; arc=fail smtp.client-ip=52.101.46.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mt725Zh4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jrf+/FF90VQZsUSJLXSzZ21uxBbULspA4jTzr5E5oCH8FK06mGxdQ8Y1Mj/9mceXFWf+E6KTJZ4Iddg2waPUDxfIATuXvykJK8qloXJl9a3tV3hh2iCj42qxAR64y0DdqGoE0sdGf/kOomE9uP6nJoJ2dca7HsG+66A7uuL+O8RN5NWAJCbw4wk0Cm8iEL8/f9TKDxbX961Z/H0bUhovPhbiUHFUzB2vbt/wNRY7R/pjaSCrmnkm/7liKgU8+KSMaYE9Oxr/8GuDq9NJwpuzJkhCPLsqavt6KUPWKEQZZB6PXWj5QlPn0z7PrRKjLbPEq5EY2btdFI5CSXIMP8YhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjPLSz1+U2xJQMky/XEc0VJkzjQvcbveEu2BatkJrsg=;
 b=eDhIFLYKUMfF5Jod7eoPR9gdG/J6uQu2+xabmFzTbOUlGQue4T+3O4T+KaoBlWYWCs4Omx1jH4l3F8H5Yld4zFhSV+LJRcFgJ+wXV0dk8J1jdEJOrJQUxbVMfBa0Zi1hydBAZuu5PLrtQXA82n2k8TBqnTMglzpIwmfvLdGxx95rPVZn0i4yQcWt9x4J8moMPqeAaEYyXSdqzz9Z/ebyj1Ts8DqH4H9oCeV8oBztmd7KyQH5u+EBC2AI6dfflItNvV4zRRQ9VnFn41s5mQPQ92rrqF3fSQBXSWcC+dON51sFuyVeSXVis/Tuvsq18/pV1eEk/0dZe8aB6mWRBJsWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjPLSz1+U2xJQMky/XEc0VJkzjQvcbveEu2BatkJrsg=;
 b=mt725Zh4TPk72j2ctjhbs6EGn0aE3TvgN1sERPUsqPXgVAAmDyN2vgnEvQJwKLVPEBpxApBIbUptKPPatepuQs87SAHxJH7wf+D/vwMtn+m9zCtaNSNx7qEbCeDDxO/iotO8qWtdNlkqr4kugtT5j4kmlK95OVBXCPqLxepLSPiHhWRGm58y647xBDWyt4WRxaMoYiejdYBja3RtJrm0m2VZNU03ADLWKK1PIP/7SRW6nc/IBcRDS0D7n60bHIEgM8UdPXMIX0NTdDpJTHDiVuV3XzgpHOcgOU3q/oxHiLCUemCmzdwWz5qGAXRivs9bZr//ilvY5dQBx+4YGcr1HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 11:10:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 11:10:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 20:10:36 +0900
Message-Id: <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
In-Reply-To: <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: cb376d8b-236a-4a82-a873-08de7b70ffe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	mKI1TAhNZRBmvIN2iWXR7+VnQN4htm4JJkQIsrjued1i25+BNN7Kf5oJL8a32GhzWiLf1UBI3PuJwJphmq5XXBrI+tSIGYkSZmP8mKXNdPtTii8l5zJroYx5/EqOD4hcN7iXrKdXyMJWuK4j7ss9dLcY3t0rCq9kEGFkU1Orck3Us5JPid0UN4CW2LT/g2vhpZ2uU/K++BYFFVWKK+rY2AqqhXX0GS1kvyLPUm3EE7AhaXHFyCBMKLRD8lUU4X4qSr+UEfw/f6d/4ET0+PEi5WJ/ncHTODhP9b2Lp3LqOY9mNkhVqBBmh1bjtXsM2NPEUhBGB4juL005hoomztMx7Q3/+sDxutZjHH0acvIxyhSTBOoB8djqOvj3o5KiFr36rk2AWjmCRZtlbqQUmsQd8WrE6PiV3DXN2xOp0fQD4SJsPvncM6m57mMHNtdpgdujuP2B8H7fsY3qYWRPNO+1/c1unJVAnw5bqTloHeOQigqt1QhSTVh8fwPb8GAHINAB+Msz1gHqT3iX6uC7lro/uPGFTYUHnjG+15pnZFdeusMp+7BAr4zsy3NY9rcf53Q7GU76NVT0Gn2q6577LNVDg7qCg2nNco/AUbVIP1zvegWf//gfODQVY95+nxK0smJdZhwbEdC1Gv64fqLt7sDxk1+4/exZNsiRIbBG4CoegtyXjwdPCl+uymkbcSrVoSJBequqfZ41QklhFPBBzRBn7/me2D12jr9p0bydTFDRN510vsqiS105IF8y+uoVAPBa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am1RTXVycTdqRVdwenpRRFdTK0FMa1AzK1VxWHBaelltTHEzOEl1SkEzcnMy?=
 =?utf-8?B?QjVML0lLZGFlc2p5T1FLTHduT0dGZjVyNUgzYUI2aGZ5RHhURWNrZjFIb1Rn?=
 =?utf-8?B?MVhWcHYvalBUSlI4QTR3c2JPQkFlUFVBc1Z0eHFvajBaTWV5S0VUNjluVlda?=
 =?utf-8?B?RmVZYU04bDVOazJZcW11MlJDaU1wS2dWUlZHaHhDSGpnVEE1T0V2TjNQUExJ?=
 =?utf-8?B?RTNwMjJCWnVVUFA5U2grTlFia1krOHhheVpHWG1sMFhXRWJaRDQ2Wkt2YUV4?=
 =?utf-8?B?SVh1RWVpNjRSMkV4UVZZR2paRjV4UVdWTWtRZWZvR2RIUjQ5TVozeE9Hb2c4?=
 =?utf-8?B?cmxPY1N6Qk4wb0lwOXZ1Z0NmZXF4WFZGcVV5cm8yZk5RNmhQRUZYa3N3bTcy?=
 =?utf-8?B?Qm8xRFZyRnBKUmNRWG4rWEpCeno3R2lPYy9hWWF1RUJ2S0FjMXlUeE8vSGFR?=
 =?utf-8?B?eE1VZTRUbGlnYy8wZGU5Rlp4YWZDRXk1NmlEbXBxWkJqN2FETmZGNlBLZ2pl?=
 =?utf-8?B?ek4wZFpDakNHeUYrZTlSQVcrUWxONXdTZWZEWVFCUzB5aVVpTlFsekdrSFBN?=
 =?utf-8?B?Q2c0azRhaUdGclVVSkc1eS9ySW1jMGE2bUxxUDZjeTlxYjhnMGNKeGhtQTR2?=
 =?utf-8?B?ZmN5YTNTWnN4RXNYSG9yQk9wbkVlSklYQUVmZmhKdkppemc1NXB3enllaDZx?=
 =?utf-8?B?bnlXQmRYMEVFWWp5aVFkTnFscG1xWDFvOUdzbDZONlR6MHBFZUtxRVBDV2Y4?=
 =?utf-8?B?MGtJeWxxSldudG9rNjZSWkJxK01zSlh3ZExVUFJzQ1pFL2ZqZ1NNOHJFVnhY?=
 =?utf-8?B?WXdvN2ZDcElHZitGbkZ5TmtlNXpsMjFZZmJZamR2VXUyVnZyRUNvNS9rNi9W?=
 =?utf-8?B?cjU2bmtTYUE3MGRWUnk5dUVteTZPTnNUV2VjSDVnU2s4dmZ2MlpyRlBFZGF3?=
 =?utf-8?B?SCtLZFM5SldNbFdNTkJLYklMbkkxckx4amRyWkM2RGNpRFlnVU5oWFhxWWo0?=
 =?utf-8?B?LzJjTGh4eVhvcWh0aCs4K3Ntbk1TR0tjaWFXUkJGbktXVk9Nd1dkblkxeFpP?=
 =?utf-8?B?bzdWVXVvc2wwV2lVWGdVSjlsWHBHN1d4b3JKbkROekc0YW9kS1Q0TnNDQit1?=
 =?utf-8?B?U1o0Rk8zM1YxQTJ4MmdiK0Vkb1lPRE9zUVI4TEN2dVlFRy9ZemdXQnhGOUVi?=
 =?utf-8?B?S1RPcE5obnhRSkZtWjhPQXZmcXN6K1lDZ1F6YkU3aDMzNGQrcUg2UDFad1pJ?=
 =?utf-8?B?WHloMVFnU1lQd01JWmIySU1lOHlzVE9PUWpRME5HMWtRRmxPUEphR2xUZHA1?=
 =?utf-8?B?WWgxOFVRMjRBcWd5NFV1Z1lRbGkvWXpqdUF4NzRROTFQMEdzV1FlR3Ard2tF?=
 =?utf-8?B?bjRGL1JSMjBVM1M0bTVJL3ozWDU4cklwK0h1QkN1MEJEdEJjQis2L0ltZGlo?=
 =?utf-8?B?Rkk0dnhpemEyb00yNEZxUnRqYlZkN0FVMzVJdUQvU2ozbFJreHJPdmkxQVFj?=
 =?utf-8?B?WFZrR0Fub3B6R25pYVVER2oxUnNkaUx3U1JWcThjclVTWkhMSTJ2Yy9pUitU?=
 =?utf-8?B?cVo0azNYRzQ2blRxVWU0eGlpN1RHcVFuQlVRZFdxbTZuU05oMlo3LzZoeFRC?=
 =?utf-8?B?cEZYV1BtVmM4ZlNEQmpVeDhkSFo4Sm43SElValdHVG1PMGRrcXdWR2Z0L1p3?=
 =?utf-8?B?dFdCbDlSMW9HZkl0SEFiWHA2MG52eHZNdmRGVkdTcGJxYS9XZlZHRDhoR2s2?=
 =?utf-8?B?Y1YxN3lxejdJdnVuK2RYdERSbEZTSmJnUWlSK0lIVDVhWUwzdHJVMmszdXR0?=
 =?utf-8?B?c28wanVNZnkvVXZhTVI4bWp1R0t3b1VkY2ViM2g4TkltcXZqZHpiN1Ixbnlj?=
 =?utf-8?B?QitVRVNxRjRxeVcxTUx5UXdUNk81MDZ0RUt0TVkyTDJyVndCSCt6ZGtyVEdY?=
 =?utf-8?B?cHJObGtMRVVxWEdqQ1NYcDZrYzNQNmRCL3E3c1BqWC9QVnhuUjNFUTRLS2hS?=
 =?utf-8?B?cDY0bzk5TUo3ZFk1TWpNWkFnMi96QnA4L3dPRkpTVklyUHRsWVlqQ3ZNWmxq?=
 =?utf-8?B?dFZJa0MzY0lrNHErTU5xN0ZPZXAvNjlGTWEvajBOVlZhSUFpWFkxRXpyRVMr?=
 =?utf-8?B?N094d1R2SmVOdjBZd1h4Q1AwcFNRQ0d5VWk1dlpPc0NvUm5IRzNiWU9Qa3lR?=
 =?utf-8?B?VzRtYXBCUC9qb0FUWCtPSFVMQ2NmbVcwcER3MXY1NjA5d3lhd2pEU1hRaGYw?=
 =?utf-8?B?cmx3eEZhclJwYzl2N2lYTktsNEhISlVWOFc3TE5pK2t4bnVSWkpEQVJ0WFdt?=
 =?utf-8?B?L1hVMUUvZ1FuNVNOV0t1Vnp4RkJtTCtidHhZcTZ5SVg0cXRrSVpXclpoL0dh?=
 =?utf-8?Q?Y3k/rHUPjEBnHsoJoVssIbNaHMF3pLwf4IBRRJJl1HvL7?=
X-MS-Exchange-AntiSpam-MessageData-1: yLSmerXaEKZU6w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb376d8b-236a-4a82-a873-08de7b70ffe6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 11:10:39.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1ETsPszvzuL4bQL7YKg4qVAbG/xfTXLfSCrQgJ0gnVPmaPKGPUED22GsUilIAyhbdsQusHgWtW5miD9cusPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662

On Fri Mar 6, 2026 at 7:42 PM JST, Gary Guo wrote:
> On Fri Mar 6, 2026 at 5:37 AM GMT, Alexandre Courbot wrote:
>> On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
>>> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>>>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>>>> Even for the cases where there's a PIO register, I think it's benefic=
ial to just
>>>>> get a value without a type.
>>>>>
>>>>> I don't see why we want people to write
>>>>>
>>>>>     self.io.read(UART_RX).value()
>>>>>
>>>>> vs
>>>>>
>>>>>     self.io.read(UART_RX)
>>>>>
>>>>> or
>>>>>
>>>>>     self.io.write(UART_TX::from(byte))
>>>>>
>>>>> vs
>>>>>
>>>>>     self.io.write(UART_TX, byte)
>>>>>
>>>>> what benefit does additional type provide?
>>>>
>>>> Well, for FIFO registers this is indeed better. However, my main conce=
rn was
>>>> this
>>>>
>>>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>>>
>>> This specific case is indeed more cumbersome with the two argument appr=
oach,
>>> although given Alex's nova diff I think the occurance shouldn't be that
>>> frequent.
>>>
>>> It's also not that the two argument approach would preclude us from hav=
ing a
>>> single argument option. In fact, with the two-argument design as the ba=
sis, we
>>> can implement such a helper function cleaner than Alex's PATCH 10/10 (w=
hich uses
>>> `Into<IoWrite>`:
>>>
>>>     /// Indicates that this type is always associated with a specific f=
ixed I/O
>>>     /// location.
>>>     ///
>>>     /// This allows use of `io.bikeshed_shorthand_name(value)` instead =
of specifying
>>>     /// the register name explicitly `io.write(REG, value)`.
>>>     trait FixedIoLocation {
>>>         type IoLocType: IoLoc<Self>;
>>>         const IO_LOCATION: Self::IoLocType;
>>>     }
>>>
>>>     trait Io {
>>>         fn bikeshed_shorthand_name<T>(&self, value: T)
>>>             where T: FixedIoLocation +
>>>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>,
>>>         {
>>>             self.write(T::IO_LOCATION, value)
>>>         }
>>>     }
>>>
>>> No need for a `IoWrite` type, everything is done via traits.
>>
>> That's cool but will only work for fixed registers. If you work with, sa=
y, an
>> array of registers, cannot implement this trait on a value as the value
>> doesn't have an index assigned - meaning you would have to build a
>> location in addition of it.
>
> For array registers I think it makes more sense to use the two-argument v=
ersion,
> no?
>
> The example here is to demonstrate that we can add a shorthand version fo=
r the
> fixed register version that can write a value to register without mention=
ing its
> name (as a supplemental helper), and the basic write method is the two-ar=
gument
> one.
>
> For cases where the type doesn't guarantee a fixed location like FIFO reg=
ister
> or an array register, mentioning the name twice is fine.

It's still tedious, and a step back compared to the one-argument version
imho.

>
> [
>
>     For array case, you *could* also do
>
>     impl IoLoc<RegisterName> for usize {
>         fn offset(self) -> usize {
>             self * stride + fixed_base
>         }
>     }
>
>
>     and now you can do `self.write(index, reg_value)`, although I think t=
his
>     might confuse some people.

Yes, in this case the semantics of write's first argument would be
dependent on the second argument... I think that's a potential footgun.

>
>     For the fixed case you could do
>
>     impl IoLoc<RegisterName> for () {
>         fn offset(self) -> usize {
>             fixed_loc
>         }
>     }
>
>     which means you can do `self.write((), value)`. I think this looks a =
bit
>     uglier compared to a dedicated method, but TBH it isn't too terrible.

There is another potential solution I have played with:

    https://lore.kernel.org/all/DGVJ7VQX3TD5.2UYW004QJPI6N@nvidia.com/

It would let us keep the 2-arguments as a base, while letting us take
advantage of the one-argument syntax you proposed in [1] and extending
it to support other register types.

[1] https://lore.kernel.org/all/DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net/

I think it turns out pretty nice and the supporting code is also not too
ugly. I'll try to send a diff a bit later so you can see how it behaves
in practice.
