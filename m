Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A742D978A;
	Fri,  6 Mar 2026 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809852; cv=fail; b=KQ1keCQCOe46dr8+Hl+Hce0/jI+GpDq3TDNfVlvPLJxH7B1X/OIdNgZedQq6zEaPqBLVMLa8F0cEoyDcNr+c0z8RPaWkgvnYBISrj2KtonfQCTDg0v08MGBrh/pWQdDimL3XoqUpJRowZekhtqCPAq+x8SGK9oJKnvR4vVY/8kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809852; c=relaxed/simple;
	bh=PdXOxVOM/KBGGOHLOBlN0khUjVOcMSKZgsFaQVpqdL4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VMqSqO7ajM0/6DAuvvCrkshUeAHS1pm9+00n8l2MpItmKjqQrz3sowKD9ye2twkU3nzkawmDieAPHGgMF0Y0H1x5jRI3G8BDRedVaHs16DQkiZNZezAgLHjXgRuYtxscw3lZU8UsB702auXgfP7mo0FpEPwxi4z0nAguj6b7OIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sWPxmhv1; arc=fail smtp.client-ip=40.107.209.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sWPxmhv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3ogBDqg/5ZYMHnksPQBsXsVsmiObRUnPHDh5OTaFhk0qZbHK/2FdP/iWT1Z05Sp16C4Ks4RWf1YYhYIOi7U3u3GXD/6mS4OAr1Xry38Y0xYNMkJbEUL9WoMV6e8VRn0vr66F6ozKIXJFmVoy+q/P9PV2ayHvKCfIouuZsXWkxFrFYFEwg6pe6QwfeX3B+Css2XD7eP4yF5cf/daeBm8Q0tf+nyjISImRsWOFHU64dlOlAdtqNCuXkyrWKezzYtU+3YOysgf9RHFEC9RA93QtpJnpmkZL7uvrEmbxBhWLxuFCDF1UxjVQaCaD5bV2WW8zkZQDUrYqdFEtZezJGownw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhT7hJ5Uin34JPh7B081xpFO7eoW1kxvcgzP9/v9gEY=;
 b=q/h5gu+iySozRqxNXtnaF7QvD5+8VDt/WjT0mCQPOcQnun+r7lQ4zVRSIUoS5dOgWCkURkIEHieRRp3NzJ8Ft3e7Ww3WqxTAETvZT+Y9MsXls6DxsbxghDJOSwrZ+Um1m7ivuFbGENEPs/TNRiJ6GIwS8dcCqxEGtcBZX9/hPWQOxajGm/Bgn39oljRlF1DxMqWKHwve7FT0SkZBReYk77wnvm86o1UAe3UbT5cmXgGs2lGryp1M3fc+HIFOiqMRwAQbBOp0xoD8/oCPzidoMgLGoH+X4WuGz36b8QY825X3fswlAreXh7/oS8DePIL88KrwkqqfUaZz6phqcKX4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhT7hJ5Uin34JPh7B081xpFO7eoW1kxvcgzP9/v9gEY=;
 b=sWPxmhv16ozN353EdsOyyCXoy2bW6cvcVj1sEQRt9RtFLsNlx50OJkX+9UWQDOux44H52bATFWknmgOGz/d/E23vF1N29VHjUWjDKIxVdeRjGRG3hmYnBSdKyA8nEK00nSv1XjgnUZdlNbJ9sEQ4EpCg9jEWKSUhoI72mg5qgAZJf2wdCWxvg8K6o8//RN/RWgEZj9rDzj66THH3TDrEs1ipFttaaXuP/3wJJcuwOZRqDdWYvcyRXG2GrCgmvEGZkJ5VRVJX9HjKZOGeYwmADj2O11YoFdSuXsnUw3RBdWGtewpLgfE9W9hAtfcxZbarn/BFkKQSJ6VbUOp9IX7MvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 15:10:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 15:10:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 00:10:42 +0900
Message-Id: <DGVSN2EFJMD9.16GG2818PR9Y2@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 732b86bc-8423-4014-6084-08de7b928ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	YgiQ5kGMEusIekooWILA7El5ng6SxRFQOpGfJErwORQVBAbsfqwTJvEJhg5H5ui4j4lA5c5EHuwZCmwLDBAzXwfaWP1+NTaA+/2mjac3ulf+qOy6t3OpthkDsxG8ELSQEdB0+j8ty6cbyr7hdFCgIhRfCv+WF9H+3TINcP/Ynlkpw0nDwfztoAzdaBiI5x1UCot+b01AGcXfDlOm2NNcbRWzR5SPn6+Hff+PzPRLVZqzl+5faV3b61gTfi7aSymoeszJkefXiCkzPiGqJqQQAu0yTcjB5VoplO31zn6fb1b3pcPSbgaoFuQrgDnNjq0xZEjaD6SsvRIQRkviqJVcSt+Q77saL1YCKQW5A4LQBqcmqQzvKJLxPmogMYwXCtMHLfb4D8nOyS5lC5/GHfwlrw0i0rq28iC5/KxoV/3GAbYHBq0uc1r1Eqs9irw7b18teZSPy93QH92GR7yVPnPLgjinNSHCqI70VdzWMjGVbSbZnwEdgGYMOL856tr9IEn8sM7EV6uKIMeEUVTFcoJksqxmayKAiK2kM6GiM7vUwLbXMKRlTDnnyh0WZf7s5n9Qaiz4hxevR6QKEhGA2MSmczeMyCsd1i/Q5eIc3OCOdiuC4gl+3eWIOL9N1H/Fi05Wa4mUVYbOR2xUPSAF5atCsOiEiu5J/Q5XbUigaxXnkzuDgNyuGx/LJfYgvnHeZYiZuinLR2d3e8RCkazT9xg6TMF5ot129F9SY56ROyGQ/5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkltK21DSXVEVTExRUMwNEd1RUtWSk1xTTB1dTFaV25RcExoa3QvTmc3bFFp?=
 =?utf-8?B?elN1RDlEVmEvV1BSdjRHZ2J4cC8wZ0RTbFZEWnBEOU5BRkRDQVBTUlpnc21T?=
 =?utf-8?B?Z0xUcjNFWThuQkdnTU1qd0EvMHc3dkZmWlFkODJIdTNqMkFETU9DcjRRQWpJ?=
 =?utf-8?B?Ri9yay84cXlnQk9IQUdlKzVnWG1LWWEzTnZ6QnBDbVhrb0JVUngxclh6dUw1?=
 =?utf-8?B?T1J6WFFSbE5jZy9xUGlaMG4wOFZmWmhoWTg2ZXQ0NXArT1lsenUwR016WkJw?=
 =?utf-8?B?eHFyb2xudzlyWHdRZkcya1YvN0Z4UWpFMmpXRldxWDN5SHhCdnV3WndjQ2k2?=
 =?utf-8?B?SDVseGNmcm5FV3VIek44QXU2TW5QbFlrVTUwaG1FOEhubFl5NTlIU2RCeXJo?=
 =?utf-8?B?UjhWMlFEZlk2c2g0VlRyQVNFWCs4UTBLeTNFakt2Y0p0TGRGUWZNSDlRUVRu?=
 =?utf-8?B?VXl6OElxbGhpdlJaWEVsdUIzL0J5L1k5Y3lUTU1pZlpmaU1aemxOMTZQRlE2?=
 =?utf-8?B?U1c3TTNFYXozamxRMnVaRWdneEdQZWJObFJ1N2UvQm1memtmQ2NTcnltUXpp?=
 =?utf-8?B?bnFNTkUrNjRQdUcxdFRiOHdXK0dBUUtBalhNNEJiNGJMMEIzM01zdTlBcGc2?=
 =?utf-8?B?ZGNVdVRjNFVhTkpwUG5jcUF2WE1sdVlVRjdtM0RGZHZ5RFNwOHloQzhQRVZo?=
 =?utf-8?B?aStWa2pQak9ZRm1Pa0ZObUF4Z2FFYW9xV1IzdGZBMDZyZkt6T0ZqSWtVZHgw?=
 =?utf-8?B?dVE4Vk1MWnAvMEdUM0JHWm42d29KaVlVWHVESzVPenRXLytmQmYvcjBCK1pD?=
 =?utf-8?B?YStkRWhhcWhaMUE1blVEQ2o5d2VOWXJURXVlUnZuc1d1SDRVcm9NZTBhVEJa?=
 =?utf-8?B?bjkyNFZ4cWt6NlB5eDVJako0TTAxQUozVEp4UFFhS1pXS3doVWpMb2d2M1pj?=
 =?utf-8?B?ZHJZQUVkdndNRVB6dFQvWWd0eEcvRndCUEk1dmtUS1FIaURISFBqK2lKbHox?=
 =?utf-8?B?SmlxTCs3VHMvbG5vRlpUY1Nwc0RoZDJnUm12cklqZGtQckQ5QUdVZUROb1Rz?=
 =?utf-8?B?UUY5WFdIYWJQNGFWWEFzdVU4eTJrMi9KdVJtcW5VOWVNNktKTS9ESStzQ29v?=
 =?utf-8?B?M2ZVODR4eXpRQkpBUEdQTWR4M29SNnYxRTNjNDAzdWdZWDNmd1c1L0wwMTRt?=
 =?utf-8?B?QkxQYzhQZWZaZDcxOXJQZE01OXNlU09JbFdmREJEdnVoTzMxczJsUzQwQU1I?=
 =?utf-8?B?a2F1WUYvV1FvTmVkcXVBaVd4cVY1TDhiZkVEdXFvT3JWWUdZSnpLYlZPVlNB?=
 =?utf-8?B?eHNhUVZ3dTcvNEJFeERzWDVTaEJlK0d2anExZzFKT0llZTcyRk1kS3h4S1hX?=
 =?utf-8?B?R2FnYlc0QlNTSGQwblZ0VkU4L3k1bXpReWUzVndZRHp6aENxcTdJQU1oNHlW?=
 =?utf-8?B?R0hoNUtLdzdzd0FSOXlUaFkwLy92MmZjNG14b0FOZldhZmVwL1ZBWnVTVm9i?=
 =?utf-8?B?WEc1c2M2N1g4V3R5aGhiK3BFNCtCMExNeDBxampySEdNL0JaRFFYQ0wrcUVk?=
 =?utf-8?B?c3RmL0p5Q0w3NHkwaGx1a1N0NVFCSW9IOWQrcDUxdldEYlE2cjRTMUtPMGpx?=
 =?utf-8?B?K0s0YjNhbW1PN3M0cFNvVTBGMG40alRuT1pQUjl3cG5iTUMyWHYxak9aTjFu?=
 =?utf-8?B?QzlkYjE0enFQRHNDZEVodjh6TjFwdnJqNzUyc2xRM0d5c3EyZkM2V24yT0FY?=
 =?utf-8?B?THhlWGVlMnAwYlZMYit3R08rblpVRlhISFd5TEZTTTJOUCtQQnppaHplLzVI?=
 =?utf-8?B?SjNYd0NFR2RBVDRMeFQ2dnFKN1VRclJTQ0NlWkNUY1gxWGhxLzF6M3g3WkN1?=
 =?utf-8?B?cUlpdm5KVjFSN1ZqMVBENklIdk5rYmZvWkdVSURveFBxY0FTQ2hLUTZ1dEtk?=
 =?utf-8?B?SzJnUW94RHVVQ3liaXdZZ3dxU0FZVjYrTzROL2pxb1RQSmVYcnRGN3hjV2tF?=
 =?utf-8?B?ZWc5b1NTVVo2RjVxUWFuMUM5WkQ2clFEbkFxaEpmeHE1R0FNZzVNbHdseEEz?=
 =?utf-8?B?cFE3OXFra3g3YlFuc25UaXM3ZldrcTAweXNNOXhHa2xrT1JHMlM5TnpOZ0FS?=
 =?utf-8?B?b3VBeUk5OEhmSFBkQmhoemZTTytybkFYK3RTMWJweUVLMlBNeTFOWTlUL2VD?=
 =?utf-8?B?V2JRZHB6cWJsclZDTnQxQTVhTzJLWjFsdkViWG93MGFwSEpLTDVCK2hkcmhj?=
 =?utf-8?B?QjY4WmowdnZpWUN3VkhZaFd0VmFhM1d5Wmpycm9LODE3TkdlVDkrMGhzbVh3?=
 =?utf-8?B?TlZXd1ZhV1ZjZ3NIRW5ENUJ5MnJLdlZtQmY5ZjI0ZFFVTlhDZTlRRVM1Vld3?=
 =?utf-8?Q?+EUtOMs33IgiwrjLtL3rC5NAOli8eNq8GSNgk/q31EMgb?=
X-MS-Exchange-AntiSpam-MessageData-1: R2YgfFtBCHsn+Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732b86bc-8423-4014-6084-08de7b928ab6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:10:46.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/t/l4VHr3ceAa0FXbl+19QqzewNQqJQSOAaNGDslCJgbmGri3WYpj3GZLd8Aqhz0WBtevNj1ZNEhbEbEu0ahA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110

On Fri Mar 6, 2026 at 11:32 PM JST, Alexandre Courbot wrote:
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
>
> If that works, then I assume fixed register writes would look like
>
>     bar.write(FIXED, Reg::foo());
>
> Unless we have a specialized `write` variant for them.

So, I tried this. It seemed to work really well - but then I realized
there is a problem:

The constructor of the `AtArray` needs to check that the index is in
bounds for the register array. And to do that, it needs... the type of
the register as a generic parameter. So we would be back to repeating
the register's type in both arguments, unfortunately. :/
