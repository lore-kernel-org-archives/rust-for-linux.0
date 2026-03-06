Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75653242B2;
	Fri,  6 Mar 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808779; cv=fail; b=GrwVExhG7kqS1SrejWDo+kc5S4NT+IPUNPWiOCzKpqXRTR27TkB06vdg7Kr/RbuPk8zM85a8jI7a/evp9cnNUU8CcD+oMs02Yh4Bdpp3lkhU3a6NjtnrZamghqCQKOznWBGtyw3KAoOigqHJvD6HafFCT9XBqzGBL62FeXOApgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808779; c=relaxed/simple;
	bh=q8ZNAsad01H94/VfYQSjttYbVYucKWudC8spbN15me0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Z4L2exZjMdqDl580TQzW2yPc/VSeX44IXzEB+eG95qKg7Sl0KceGjZZ3pkgJB/p6PWD5pWFOWmrYh7LZFDThUiWP2oUBHXHMmQT5AWCAZUYRcZ2EjGyHuAmE6xYAuGCV78rVQ6eqHp1mrEhW0dLGQbcwuVQpevTrAzyqE3Dtj8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FyZFSS+G; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FyZFSS+G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyUDAy7JgovgZXHXX3Oa6vPQ1v1bbRGItio8XiFstt/kBwAOueRme9Y/i9PEA6VcSfoGWEPYXHbP0cM67Kn95nS5edSLB0QN3fLMCOJ8mA2Cnr/FGp8PouPbQNXbx1TYaRRnvhW1d6siVNFzLgNYzOh/C7ziAQWZYiKP8vA+t4uMmNUrCdjZhPtRzJ3UF3lSxIHkouMufRSIhXzL7W3EvjHmDxSNB29uyYhjB6XaJ8Theh4SgNy+qCy4D+OmFZdh7QjQbJCEct6HouclorsOGEWQgbyF7mRmrsXbH0i2mL0o6g9G25Q0vQPvK06eDoJ3Y1Ze00VylDwRXaLFO4I9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVvlNQuHUwF5S/lqIwj2AaLmuu9MxezX9DzuNcistWc=;
 b=e6dT9W15m8O+f2OtBWDrzlJl2393Tliik0cymad/1UIdO76dczhzM6B3tGOC7f65xkT8gLs3IvxHlTyekhRGLdSE34TZrK6EDE1f5kCXUZWoCWnIBKx75IfT0B7LSuy0CmfQI/MNMn/Vt57Hb4zb82klRWCsoVM1IaQajnghqxIma6nCx7Yf4f/+nN8Pb1Bdq/VUhlPOQN94orctX2pIpbnIHtRpmkkK7ZbnaEm2wQetSenHafE4e5e8iyleCwX/K4nz6JtXo6M4eESGDVwnv4S4sBoeXyotRdkPw2zLyjpVHIFrW/O8Yu7ggr6P0uTK1W67Sp7UBA9SAKJoT7vuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVvlNQuHUwF5S/lqIwj2AaLmuu9MxezX9DzuNcistWc=;
 b=FyZFSS+GZ2O9wyO4oy5TD8NYUjmnZkp4eIP9ba1SK2tOHf0oxyVI6TXzf4iW8jZmCvURIb1Z56PVUP9/aF5dmSCgzdngZQLND1YIr/ktzJ6Tc9D2Sq03C3JyF9WY8x443O8gRf3NhUomrktKCRJ4x4W56TY/tsG5jHben5pK7q+dA3g6Ogj14l5Fa29cD3cdjoncQVBP/2OWYVMS9QEuCcBck/9bgkX3QIOXRKcs45CQpmlJ5wJwqMbRBFpUJDTMqmUX8xK22MI26tpfte32SRGK8PIYNdGUnLIoM6wqnDgJvuGmRdjVavP/M50+nPPZ+MbmITkjMoiXsQHL8I/4LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9693.namprd12.prod.outlook.com (2603:10b6:610:2b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 14:52:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 14:52:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 23:52:49 +0900
Message-Id: <DGVS9DQR3KVL.21PCHAV8183MC@nvidia.com>
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
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
 <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
In-Reply-To: <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: e396ebcc-cdc1-456d-d08f-08de7b900bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	YR9HgSgMW9YxkY+eux7Az00pZOVTGuLbsbvSnfm0GgsvirhdE+6HWE4JjOuSuPnNWy+vi3FF9DCERySZlOTm1+UFreHfzeWvRg3qbPlNc/GQCawIahhv9prlZV0mkhswnb/jswoFgqw1da63pG+vM1mDyW8KploGpKQtu/Om/ktgaeTep59OQysCrZPt/zOYJbfRSj9dGR4f+sknqYLUGcUPsNtaBLMWsrKYtcCuokSYrmgjh0+jGjDhdvdhNdT8CrjHZwOOzkDfTr5/IVOgvinTFOrVUd2er8QaotNnSJQnt4joGEOJovpXSsbovAkDz5KD8JqYcKcVYlzGy5vONt2CfrGXXCsWjkOUibwBq4g+rOUWTv/qUHF5RauQ9I9uqV1FxK+NIWQ6X9vTXSgox6+4pbkbDLGZs2RvA6w5CVJZBI5KpL8GUO7Xq+W6ZoMThbWZeDscA1jgUIy9eTamSGBeZzyzCmMlMGL0+jtxUp/tOI+KSET2doaNQMordbGSAL6gO+3cN0oJK/4vtLXLEfH7sfSkbQOe6MlzNvMHRSvtSWPhz8rsOpuVwpBVK5iWB14CDedLqVSARhVg99G60V+kyo5XmM9nrrUblMirLZIBkuNvNxOJi2Irf/KI34784DHfpUekq8MT+SesASkq23IT4XNKOV4bOsp8unxEU/+sCd/tJsJLqdsjjMcqM97X1NWpvCo3MWxvsdDSRIKFRj7IyIw4hxy8SivIbpX6Zq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi92ZjlFK3ErdVd2NU03UTZOeFZvZ2FRVG1LOGpNTlh5R3RObnJVcG56b2hz?=
 =?utf-8?B?UU1NT0ZqM1M0RHQ5OC9UNjY1T3FiVlFmdGNmRmhlZVN3NGo0TmtvTU1xd0dv?=
 =?utf-8?B?Wnd3MUY1UjJrMTAwVmcwK2JIeHBtU25NQ0prbGcybGVaM1EwK3lGNEdkSkZp?=
 =?utf-8?B?d1NyV0tWejNHQjJsNWtoUlU4WVVrdG1RVHp6ei9UbnZNSXczQ1ExWTh0Sk8w?=
 =?utf-8?B?SFdVRm1hYUkwUlNxREdKTWZZenhaMitEV243eGM5WjBxd0dmRm5xTDJ3a2FK?=
 =?utf-8?B?Q2Z1Q3lZYVhCYUJRaUg0ZExSZGo1dHZJSENOcDQ1NGl1cUxVemVnM21QbXVx?=
 =?utf-8?B?dCtyTDlOaVBZVGQ5eldOVUVLcndwNzBHWDVOSjBSelR3VTZTMWpzUWJKcE5Y?=
 =?utf-8?B?NlFwUk5YY1M5YmN2ck9rYVArbHBsS1dEaVFOUHN5c003eEZTbjczOFdXZnUv?=
 =?utf-8?B?NGIxQXFCTzAyQUxDY2l3cVF5Vm1DN1FYVFg4aVV2L3RvdGRQMDV5eHhKc0E0?=
 =?utf-8?B?S0VXNHB2Z21SY3JxN0FwdDd1bk1HR3c0UGhKckdrcDJBbDMxZTBlY3l4UE82?=
 =?utf-8?B?ajYzMXZRZ3o2UzAxYitQTGxTa0dOejhQN0VyczFRbStlTGlybmgwTm1oQzVl?=
 =?utf-8?B?N3VJb2lOYXlsNnhxSzN0RzFsVndBaTlYbFRUT1BTYTdCczlQaEpiUnR3M1Yy?=
 =?utf-8?B?Z1Q1UHhKQUR0emJxYVA4a0pJeUJyK3M0a21KZjVxUEM1U0swY0pwdko5eGdD?=
 =?utf-8?B?ejYzVUhaMnhkU2lBZGpoTDUvYTYrY1NZOEM0SDlkODdFVVpXcXVxUWpaVW5O?=
 =?utf-8?B?ZjNJZ2FHRVg1c0NuT3gzd3RIcE5uU0xla0hvQjl6OVpockJ1Ry9iamFxaWQ4?=
 =?utf-8?B?MzBEd0RrSlRRcHZVVVZDTUM5SlRUalo4b29hbm00WXJNRURvZEQwdytZZnFK?=
 =?utf-8?B?UHZsWFNteFp5TGdOMXNVc2V5QzdJSVh3Sk1wdlJpT3g5YVlQbWc4THA0K283?=
 =?utf-8?B?eWpYaU5ZK0tXUWdQNkFaZ1JUSTNkbllvaHB0ZTVsVGVTZDFQakhYb2RVZVV2?=
 =?utf-8?B?Yks3STR3ZlNMLzlUSG1FR1lJM0FkT2dReVV4SSt1VVZxMFBGak1JK2V2MGEy?=
 =?utf-8?B?bVU4UFV5N0JYNTBnb3JQY1ZlaFZJbE1IQWVhaWhvSzBFUCswQm82NXMreU1X?=
 =?utf-8?B?cHZiUkxyK1ZLUXJiQTZySmJUdjFRb1o4RzBONlpmWGtzWHhKQUQ5QkM5N0FS?=
 =?utf-8?B?TTdDNkRRS3k3dnpDbkcyc0ppZU1mSjRmdTRCVDFMSUhxZXVOMXlkTUhMbExr?=
 =?utf-8?B?NW9YYXpHZGVFRDdlN0toeU5xOFB4RFBmbzJzZU1BdSsvYzJQMFBuSUk4TTJi?=
 =?utf-8?B?cC96WHJTWnBMVmdod2luRXRvUGNsV0RVK2ErdTJMVkozWjNqVkNEVjR0ekg2?=
 =?utf-8?B?WmNoSGUyaHB4OE1ka3F1cWJ0Zk5kRS8waFhzZHByQnl4VUIyaVJrdVBibFE1?=
 =?utf-8?B?aE9RVi9EQWNFRG5pS3V6OExVMEpXbkt1SXNkT0JTelk4c2JsTkNLYlp5ci91?=
 =?utf-8?B?YmpkblY4QVBqWnk5cE1aOEo4RHN3eEQ1QVNPU0hQa0YyWm5mSGxXV3UzSWNX?=
 =?utf-8?B?L1Bodll6VXVKTlRlbTRzN1dVcWo1cXZIQ2lXU2RXbHExQnROYnlmVm9aMTVl?=
 =?utf-8?B?Ti9wcnZwM2lLRGNTdXp5VG05LytUckRaV3RrMEpEcEQxSFhVZmo1VEw2UzFD?=
 =?utf-8?B?UEp6WkhXazJIcUVFcGgrYVp1NnYybXdQVDRkTU9RdzJ2RC9XZGNhWHF4REg3?=
 =?utf-8?B?MUZuTFpMaHNNTXYydEluS3JNSHV1RnRiRHVSYzFKQjdJL082M1kyK0ZnWDBx?=
 =?utf-8?B?aGZEbkN1T0xtc0N5bXhoR0FJMEtvS0llN3RRdzFweVU0cGlaYi9ucE1nek5O?=
 =?utf-8?B?dGJBWVcxaHNNZGFNVWFmUEoxaU9XZFZ0V2pmU28rVTg2K2RzRjdMZVgrTkRz?=
 =?utf-8?B?bnd3enQ4anBFNnUxZ052L1BiWDk3QWZsY3l5VVpxOEFnOGVCTnRCQTIzc1F4?=
 =?utf-8?B?eHhTdmZGQ1A4bkltVE1GbzdSN1l5by9qbWdwamZYYlJlbUhjOC9HVmljWjZa?=
 =?utf-8?B?MWhaalpDSlZZaWNPWk12TE1ndCtZeTlCSVZFZjJLdlVVemFMekpaOVl1OWU3?=
 =?utf-8?B?NWZNaXl1MDFLZGNzcmFFZGhENHZxOG5iRHY2d2NyK2dQaGJYK3hZK21JSno4?=
 =?utf-8?B?bFNlZVR5Y2JiMytuNkp1UkFnMEdFTk55MWFwWVZoWW9kMWh4WXlNNkc0aXl1?=
 =?utf-8?B?aDR2S0xYVGJBZ2FvNXNrL1RJYnpKQ05HZFRmVW9YcnA5ZGwvcitHZ2x6THVE?=
 =?utf-8?Q?Qn1DuaGcw2oMbuD+dIYkGMVkIr94Ia3lcWvDU6BvJSGxr?=
X-MS-Exchange-AntiSpam-MessageData-1: CaPSPkCOL89JIg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e396ebcc-cdc1-456d-d08f-08de7b900bc5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:52:53.8266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I47JDzLLFzK/utjyINxBUzUjFG09LSd8zJT594341L8daUG1rGI15AKzVx+p0Qlc81ZckNYhEngW+p9e5y9SRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9693

On Fri Mar 6, 2026 at 11:32 PM JST, Alexandre Courbot wrote:
<snip>
>> `MyRegArray` here is a type name that is a bitfield and not an array. `f=
oo` returns a
>> single value and not an array. "at" here is saying that the register is =
at a
>> specific location and doesn't really indicate the array nature.
>>
>> This is why I insist that I would prefer an explicit location
>>
>>     bar.write(REG_ARRAY.at(10), Reg::foo())
>>
>> would have no ambiguity whatsoever about user's intent.
>
> IIUC `REG_ARRAY` would be a const ZST and `at` a method returning an
> `AtArray(usize)`? I still have doubts that its generic type could be
> inferred automatically but it's worth giving it a go.

I don't know why I assumed that `AtArray` had a generic - it has none of
course. So there is no problem building it in this context.
