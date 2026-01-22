Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A955E365A00
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 01:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046325; cv=fail; b=GaZ2BwR+/EfCbxmJcz+I6gyZtzc8M2WgnTJ7HG83XF5GcVS8rytu5PH8f6vqTTlNhTXTbN9rmyVBq8CI/dxBCntG0chiBMTN+/Z0HOtPKUhdMDmP5OSH5Nas7h7x59ZlLCvLpu7AfRKY2cEqJKfwmTHIMduIvLgoOD3Z9bY3x7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046325; c=relaxed/simple;
	bh=816jRsGsEsqvFPvZMc3ZUljShksYoR6VA7XYYnAs8rQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=txlOds6jJf7sJAi7VQRnxwnvn5BuxtQAl5UqCJlyp7lWvNUjgrtvDvmMJe7fmkltf2FqaZULsNl5C1dfslIhs+fOm3wcbBccEOQsPZ8xII7fUB3kfQ/CZI/h75MoiSffCDKEx2dBJss2Yjaq87udymIDcbcAs42UhY2jpMsFZiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qn4T4NiJ; arc=fail smtp.client-ip=40.93.198.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qn4T4NiJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdbJNR1sZOAHFad0KTYKNWTsi/fb+/6kTunuQ72HMlUrcicDe/z5kHasfTKlRIQd+P7sK/sUO1SrUfJ5XwYnOFyA7hDQD6o2aOi46emM7LioTQXTByL5HCxBDGlH6krYTcJcVmKb40z6Qh2pTi4Qq8B6FA05S358hB5tPxH04dHxTlgByNyGJ+EqteuS7grZ02gbpGM/8YJMEKyDjciOUc9j47AYr6zZMMBgGoOL8IhL60wfJovs5yWqQOXxNnt/oNHFGBwovsd6riEMQzR9sZ50cqbvjVA6BdYxfPuUGXIcHxZgQ+5941LrRMNpOq98UUrFuTekbrISqTPnFcgJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL6kvUnR+OHDGFvIAjSi3P4cKnCpF/+TOhuOp7ceGx4=;
 b=RDw7LtCAPbdVBuhpqYPi7yMBekDYXHEiSpQAJGq9m8V/bRgaPdJMg8HyzZIvdtFHv8XzwNE+psfruvpLMQl27GoDe3a7/sFPS0k6491JJhPakpZBPZXKnuNXS975zHEpHgt8Oj4knI9OaGk/SieB19iM8W1EmwtP2FahoydjT7QzxEVetc/d/BjTSIHRm6AhHfjUxGMynmu0zsYH/8wEV6iZJ1S1gDxnBjoZyDC6Ew/qf8UUziuPKvA+vyCRJRiv+r06KBuUvHLc2pICmE4DJtiKp6zxthcxX8LlBApq8tdc1eMxN9NcFr4zMrT1AvXI5oGXWYQE+FwUQQ2dpzbydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xL6kvUnR+OHDGFvIAjSi3P4cKnCpF/+TOhuOp7ceGx4=;
 b=Qn4T4NiJBHKSu/NsTK58f8FsLyB8SBY34KxXAVLCcNDlpLWTX0ldI+lx8rwW5WbDs/Gd2gg3gBB9Zo9pTJceTA4DUSfIZn3cJbAHVCF0c09iIiirRTuRGPEcT1UhVXnm9jCY+5HZQZptKRJb2fZdESfaHMKVEgYUTxze+0uYknUXMkyde1j64uAlO+sKopKB+4zlsBB6eKQpq5C/FWhT9SXRfprkVuOMRnCLuHt/FORqEtTwKx18aTkR4fHEy4ka2N0QNLBbOE5XhUDX2M/tsOS1R1vF5RCxv43gnmFytvRSM7n+AzqOXdb/U4LS9CyBIOKgGbN2uHs9j+tzQM3MWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BN7PPFD3499E3E3.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 01:45:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 01:45:19 +0000
Message-ID: <ca0628cd-0044-4201-8f1e-899a85ee52b0@nvidia.com>
Date: Wed, 21 Jan 2026 20:45:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] gpu: nova-core: add FalconUCodeDescV2 support
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20260121235302.1962185-1-ttabi@nvidia.com>
 <20260121235302.1962185-11-ttabi@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260121235302.1962185-11-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0386.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BN7PPFD3499E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f10a4ca-4298-4b92-cacb-08de5957e628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alU5MUFCRjRDZU9uSWp6bm84SmJxL0hyZW44WDl0bWtNWDE1QWl5UktTdGNS?=
 =?utf-8?B?VjY4MmlJejBzdENJQU9mc05HSWJCMFJ4TW9tWVg2a3NUeVJoYzNTdEMybEpO?=
 =?utf-8?B?Qm4xVUJFeG9IYlZhTzNYYllZNW5vckpNamNPWkY0dFpyVmE3cVpyM3VCYXN0?=
 =?utf-8?B?OFFsSURiN0l0dDdUbEFUYkRFcnFFaHYxYlJWWVhUU3A2TFVONDRlOVNJT3B5?=
 =?utf-8?B?d0VuMG11ck9oRHhlM1pXaWRDVnlxZnBIZGNvTXNDeVp1WUdGZm1EamprejVH?=
 =?utf-8?B?Z1lhRUkvTXFTeEFxb1ExR1hmWVNEZUFBTkRML2lRQ2N1TGZiZUFoa3JJMHds?=
 =?utf-8?B?MG56NGpFdGZJTVFpQXJjMVk1djR4aWFEc1hZTHlOTXpwUWdBbHYyTkpNU3VZ?=
 =?utf-8?B?SVdOdklzcHpxRHJmOEpxUnZlUWtBVHdpazdzb3JDSUZGNnhheWxJcWFGTVJk?=
 =?utf-8?B?cHZQVUtqQXFKOVdZSWtUeWNNM2RDM1lZZ0N1SlBkdEJmK2RxanBNTXlETVd0?=
 =?utf-8?B?WmVhNWlKMzNhemdPZWdaQnNRQko2dUh1TjFCT3M1eUgwNnorSVZrUXUwaUd3?=
 =?utf-8?B?TEw3azZWUWZLTGV6d3M0WHF6MEFTTnB0YnRmdDgvcWhOeWtzdmlROVVEeU8y?=
 =?utf-8?B?TjhWTTJ6K3lYZHdjd1RHRmszSStSek5OT1RraXJiNWFvYzVKWXk4VTVBM055?=
 =?utf-8?B?RXZ1dHJJSDJCZGpwcWs3Y0xZb0tIbjY0d25nNW0vWElldVAvRnhOLzB4a1Ew?=
 =?utf-8?B?eGM2MUNXamw3cTIrc0liRWJjSCs4VXNMSm9Cd1dJYXlIa05IaGU4b3FDMjUw?=
 =?utf-8?B?OVVqUEMzZTN4QmpZdTZuNVpnZmxhdVZCQlRWdVJPdEFiL0RqRytCQ0hyTnhF?=
 =?utf-8?B?MjRUS1EzandVZTVwRERwWFYrZWVjNnFxZGc0VEpTdHJialR6Ry94Tm16K3NP?=
 =?utf-8?B?T0JpM1NndTBXbCtGTlB4eEdJK0pQQjdBYmZLN1JXTkdXU3JIemNrZFUxVjNn?=
 =?utf-8?B?NmNLdzE4bVpTL0lyTmNEbzlyYkhiL1RVMGFrKzZtSW1LSE80dnNIckZQS0hr?=
 =?utf-8?B?Y1Z0NE9YYjVVc1dVNmNGRlAzYjUvbE9YdmFwak5ZK1VBcis0Qno4K1l0QXFm?=
 =?utf-8?B?Nm84YldiMktMWUtYVjNhWk54emVsOE9LcFA5M215OEVlWXluK3F0SDlwbFl3?=
 =?utf-8?B?akg1NEFWNUhveExreFdxTTlhUy90TGxtalBldnMycDNGckZ6aVZ6NHBMRkFj?=
 =?utf-8?B?b0dNSi9VL1JxdmYzTThyemlUR3R2STQwN2xhT2dOck92dEUxai9QVFMxMDh0?=
 =?utf-8?B?NHBVeG9LOGg0cUNWb2VMTTUvanZ0U1dCZFljWHVCS3pQMXlLS2RqVHEwU29E?=
 =?utf-8?B?Y3ArTEtCVWZMc2hlK3MyellLU0hjS0hKUFVtNHNxUG5FSDNaVGwvQkNOZHlC?=
 =?utf-8?B?QllFSUZha0FveTc5MnZKbjhIQlRmODdzbE5RdEc5THRodU5iZHgxbGVpNHp5?=
 =?utf-8?B?bENoSDVzWUZ6VElmQ3RGREtSbUhFZXM4UktjQ0dJUjdiQWp4QTRLZ0hseFp6?=
 =?utf-8?B?RzQxKzRTNlNMNHNoWnRMMEQ3RTJ4NjZnTTdwd3l1Wmx0aUFFczJXWWtvNjI4?=
 =?utf-8?B?bEFGb1VVcWZoSEFZOFRKVVFHa3dPaU4xcnhpY0VKdXQ2dVlyUnY0a2pmR1pT?=
 =?utf-8?B?NWF2RldJeEh4MVd1YXBkZGRrRVVGRHE0eXZlb2ZtdU80d0FuZDNnb3VNM3ZE?=
 =?utf-8?B?N3AwY3BteXZIaSszMVd3c1FiOEtrVXoreWRIZ25YZzdYM0VjRklsSUd2UDJL?=
 =?utf-8?B?ZWVzOWJMVEJ5NE5SVmhxNnhNYzZJZVRkUCtUTlArTjhYeEZUR0ZOM3ZycWt1?=
 =?utf-8?B?QlY1K0VVK0lvN3Bhd1dpNHVld3haMWhsYjFOdWFhZUd2cFQ2WHdPM283UWxv?=
 =?utf-8?B?RHdXdlZ3bWhjWDhGZ3QwTCtiaXFFVVFNOVRtZXlaM3NlbDE4N2Z3dW14Nklz?=
 =?utf-8?B?N2wvclNpSUZwbGpwdlJmeGl5ZHQ5QUZkeENQN25MTG1CVXp5SUlnTndVWCtv?=
 =?utf-8?B?ZkhUNlVRRjhpeXlyRkFiQlF6NnZ2dHNDbmx6bmIwUGp1Wkl6cDgzNDg1ODRL?=
 =?utf-8?Q?qW0I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXhSTGxtcG93VXlBUncyMjVwd05LaDJxRkw4ai84NUxGUkpVcnJOU0JOamtS?=
 =?utf-8?B?ZXAzN0dSdHlNbERpenBQUExycHd1NnJ2QTkwNWprQlN5SklOQThaRHY1Qit0?=
 =?utf-8?B?LzFvd0NvYjdVVG00ekZZVHpQM09Vck1aTWpod1NVb2oxVkwwSE9xSC9kdm54?=
 =?utf-8?B?emRPbi9US3NNaEFuZnpTY21iaUJEcFQxanNIQ0xwZ2MzRXJRL0QvdXZOU3FI?=
 =?utf-8?B?WExvS0taRDhlaXJuazhiY2lmOHpNdis0UnhBbWZ2cE5CSXpjWkJyMUU5dFc0?=
 =?utf-8?B?VG9JUzhSRkRObG1Sc3lGNnN1cjhtMFFwbDcrdWQzaXVzWE1xS2hsMjhzeE1I?=
 =?utf-8?B?TEYzSTRlajMwRXh1Zi9oSDlHakNBNldDS3VtcHh4eEdpQWlIc3k2dzBZRFdx?=
 =?utf-8?B?SXRWTDNBVURlMGxhZnB2N09kZmxsMjQxNkFqNlVDR1ZkOHArWjFXaXk5SUxS?=
 =?utf-8?B?Vy9Bb0dKcUtoRDRpV2dwRWxNMVNHRmc3S2Q2TzVvdTQ3eW1rcGxJUVpNdW0y?=
 =?utf-8?B?Y3N4ZEVrN3hRcStkeUViVHRSNTZpNEh1d2Z1czF2WGczM2dqWUhPMklwblA1?=
 =?utf-8?B?eW9WWmpDNVJzeHJsa1RHd0w4Q3NpSkZ2VFY5SUcvYzZHeFp4NjhJeTUrenkz?=
 =?utf-8?B?OXBwalpEZGw2bzlJeUtuU3VVeHZWUHpFSFJRNSt1Qks1UkJOVGhaRkJOK3Vs?=
 =?utf-8?B?ZUpLbzFWZkZ0dWE1a0pySnhvcVM3U3l3cjB6YU4xcGpMN1RtK2NiUE9YVmpM?=
 =?utf-8?B?YWFWZkdMK2svYXpRR0ZXNlc3WVBJS0dJNG9Lc3RmY0ZjTjRraGdkU1duQ0lV?=
 =?utf-8?B?Y1dKRnoxM1I5dXNEOGxqMEpkclhWL0lIMnovVmVYcEhaVGlNbW11VjYwd01u?=
 =?utf-8?B?MjhsWVpMQUZoV1VjbkpBRE5vL2Q5a3VpbnU5Y0VqQ2pSL25vc0JNODgrUUgx?=
 =?utf-8?B?WWtBN1QrMENrVDVSM1lPcUJBbW1MNnQ2WFBaamtwU0pwcDNyS2dkV2ZEZ2xR?=
 =?utf-8?B?TW4va1hXUFdoTm1YL2RpQTN6NlhkR1ZpTVlKcmkrTjMyR2t3cUpxN3F1WEg2?=
 =?utf-8?B?S1FMWWY0VFFHa3VzeE9ZYkdMZ0ZOVmZLMjhzSnpGK1hLbU04YW8vQ0lsckJ2?=
 =?utf-8?B?VTBUMnFYbG1pRFJTd3RJTURkTGkwaUN6Y1NWTHBxaGZvQ2M2aThBVU5NV29B?=
 =?utf-8?B?bzVSZ0pHSk1ZYm5Dc0JMajhwQzczWG1VOXZUSFRJMTM2WHI5N3N4dnNHenVQ?=
 =?utf-8?B?KzVjakJHL3FqUFlGLzFIQk9lN1pIb1o0ZWM2aFAwNzJrRzlOZXhSaVdsQ0NH?=
 =?utf-8?B?TDJjS1JzWTgrQ2NCTzdvMFZsL2dETmpzdXVMZzRGYk5NdzlndEFrRytDOGtr?=
 =?utf-8?B?b0VCM1RUaGFnMW9qOTFNWWsrL3VScm11T3d0bFlQS0swVjNrdDVPUm9IbWlj?=
 =?utf-8?B?ZlkvQXJrM2ZmZ3BlcUJRQmI0VThMbnpTZHVTNzFHUUJLN1d3dWJ3MkZzOCtK?=
 =?utf-8?B?aEZBK0lPY3ZtYzJLcDZqRC9rMnBCbWdvK3R2NWVrNFFwSi92V3NJY1lieXJi?=
 =?utf-8?B?dm1YMXUvRG1NVm15VDBtVWlpa1U5L2pnb0I3ZnBPbktReUxhdnlHRmxOeC8y?=
 =?utf-8?B?UEVCaE9yQjBZc0JpdTNxcGFnOGp6azQyTXdscVZ5clVQa2VyT1R0MjdoaU5y?=
 =?utf-8?B?bGhzSUJDMThzUmhYMGQxTUpKYS9IUTFVNWVYVFVJNENUY0ZCTFZKQkt4dFB6?=
 =?utf-8?B?STFyZGpXaVY1bHpId0VWak1Sckx0Yjh3N0RheTR0KytwM2xMVVgxMytYUWRk?=
 =?utf-8?B?ZkNuZGRqdU54a0JMdlFidmdPMGhIdkh6cCsyMWM4YlkwSzAxNitnWFRuSEZW?=
 =?utf-8?B?enpzbitIeERZb3hkOCtFMmZGc0lkOW85ZktQVnd4U2RlVWJyRWpXUXZWZFpU?=
 =?utf-8?B?QmNjL2FmQSs5TDRMaTVKYWNlOGVYckdyZTlVdmNPYVRmUFFWcXNuRlZ4TnAr?=
 =?utf-8?B?d3V3U3UzN2l1SUxTcTVEK3RtTGxrUVhobjNaV3FSNlB6VGVXNUJhZjM3cE9Y?=
 =?utf-8?B?WVQ4Mm5Kek5zeDUyN0RvYnFXNzN1U0tFbm03SEVwa09aSzR2ajBpbkxlTlBa?=
 =?utf-8?B?TEQrNGYzbXdqcmNRbndNNFFtaGhpalNkTzBiN0Y2SGRSRHN1VG5uNlJQTWNJ?=
 =?utf-8?B?NW1EZ3Fuc2lxcmFET1JJRmVFbnh3UXFwT2VBd0dnZ2RSYldDTi9ETXZ3ZkRs?=
 =?utf-8?B?djlpUzZlQ2l0dndrY3EvM0o0alhha3dtbmtNKzVVckVncTcyOHhtb2xuU0Nn?=
 =?utf-8?B?RjlGQ1EzbE5PSmVOcnZlcDJFbm9MUnhQZ1FvaFhRNVFrKzJ0R2ZZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f10a4ca-4298-4b92-cacb-08de5957e628
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 01:45:19.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khlag68LI/l+Wrjqv8s74K+NiCTWwc7whYUbOjzdUL2xCZCnzC9ZM3yqMvGJoO7tv5s5CqO5j3eKYREfITpmlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD3499E3E3



On 1/21/2026 6:53 PM, Timur Tabi wrote:
> The FRTS firmware in Turing and GA100 VBIOS has an older header
> format (v2 instead of v3).  To support both v2 and v3 at runtime,
> add the FalconUCodeDescV2 struct, and update code that references
> the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
> encapsulates both.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs       |  203 ++++-
>  drivers/gpu/nova-core/firmware/fwsec.rs |   46 +-
>  drivers/gpu/nova-core/vbios.rs          |   64 +-
>  drivers/gpu/nova-core/vbios.rs.orig     | 1105 +++++++++++++++++++++++
>  4 files changed, 1354 insertions(+), 64 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/vbios.rs.orig
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 2d2008b33fb4..68779540aa28 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -4,6 +4,7 @@
>  //! to be loaded into a given execution unit.
>  
>  use core::marker::PhantomData;
> +use core::ops::Deref;
>  
>  use kernel::{
>      device,
> @@ -15,7 +16,10 @@
>  
>  use crate::{
>      dma::DmaObject,
> -    falcon::FalconFirmware,
> +    falcon::{
> +        FalconFirmware,
> +        FalconLoadTarget, //
> +    },
>      gpu,
>      num::{
>          FromSafeCast,
> @@ -43,6 +47,46 @@ fn request_firmware(
>          .and_then(|path| firmware::Firmware::request(&path, dev))
>  }
>  
> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct FalconUCodeDescV2 {
> +    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
> +    hdr: u32,
> +    /// Stored size of the ucode after the header, compressed or uncompressed
> +    stored_size: u32,
> +    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
> +    /// is not compressed.
> +    pub(crate) uncompressed_size: u32,
> +    /// Code entry point
> +    pub(crate) virtual_entry: u32,
> +    /// Offset after the code segment at which the Application Interface Table headers are located.
> +    pub(crate) interface_offset: u32,
> +    /// Base address at which to load the code segment into 'IMEM'.
> +    pub(crate) imem_phys_base: u32,
> +    /// Size in bytes of the code to copy into 'IMEM'.
> +    pub(crate) imem_load_size: u32,
> +    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
> +    pub(crate) imem_virt_base: u32,
> +    /// Virtual address of secure IMEM segment.
> +    pub(crate) imem_sec_base: u32,
> +    /// Size of secure IMEM segment.
> +    pub(crate) imem_sec_size: u32,
> +    /// Offset into stored (uncompressed) image at which DMEM begins.
> +    pub(crate) dmem_offset: u32,
> +    /// Base address at which to load the data segment into 'DMEM'.
> +    pub(crate) dmem_phys_base: u32,
> +    /// Size in bytes of the data to copy into 'DMEM'.
> +    pub(crate) dmem_load_size: u32,
> +    /// "Alternate" Size of data to load into IMEM.
> +    pub(crate) alt_imem_load_size: u32,
> +    /// "Alternate" Size of data to load into DMEM.
> +    pub(crate) alt_dmem_load_size: u32,
> +}
> +
> +// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
> +unsafe impl FromBytes for FalconUCodeDescV2 {}
> +
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> @@ -76,13 +120,164 @@ pub(crate) struct FalconUCodeDescV3 {
>      _reserved: u16,
>  }
>  
> -impl FalconUCodeDescV3 {
> +// SAFETY: all bit patterns are valid for this type, and it doesn't use
> +// interior mutability.
> +unsafe impl FromBytes for FalconUCodeDescV3 {}
> +
> +/// Enum wrapping the different versions of Falcon microcode descriptors.
> +///
> +/// This allows handling both V2 and V3 descriptor formats through a
> +/// unified type, providing version-agnostic access to firmware metadata
> +/// via the [`FalconUCodeDescriptor`] trait.
> +#[derive(Debug, Clone)]
> +pub(crate) enum FalconUCodeDesc {
> +    V2(FalconUCodeDescV2),
> +    V3(FalconUCodeDescV3),
> +}
> +
> +impl Deref for FalconUCodeDesc {
> +    type Target = dyn FalconUCodeDescriptor;
> +
> +    fn deref(&self) -> &Self::Target {
> +        match self {
> +            FalconUCodeDesc::V2(v2) => v2,
> +            FalconUCodeDesc::V3(v3) => v3,
> +        }
> +    }

I guess we still need to decide if we want to use 'dyn' for
FalconUCodeDescriptor or function wrappers with separate match statements. John
also recently felt, I think, that 'dyn' here is more complicated (I was the one
who suggested 'dyn' in v2 or so, but hey - in my defense, I am learning Rust too
;-)).

After seeing this patch, I think I realized 'dyn' *for this case* does add more
boilerplate, because now you have duplicated functions which almost do exactly
the same thing (seems much worse than duplicate match arms).

'dyn' would benefit a lot though if the match arms were large. But in this
patch, most of the match arms are just accessing fields.

For my -mm patches, where I am routing between version 2 and version 3 of the
page table/directory formats, I actually went with match arms instead of dyn
which was cleaner.

-- 
Joel Fernandes

