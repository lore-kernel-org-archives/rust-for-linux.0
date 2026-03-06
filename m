Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021073.outbound.protection.outlook.com [52.101.100.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F092264C0;
	Fri,  6 Mar 2026 11:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772796965; cv=fail; b=lGfUjJUV2djX9iDt3JlL1/OvY7RUR1PQkWYRRXTa2i46MN6SUbvLxbZy6JsSdabQlvKLpmK6sCBB0/4w613LzNDYd6ujPPCANoD4aNAWaCSBkOBRtL9pBrhqGJ6rkrgFG1ARVltZBVZWlfc/breqEDMv65+eoqhRu+dyGhgpxDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772796965; c=relaxed/simple;
	bh=q6x3DUpF+ZFu4FQqgAtZw88KKvjPVvEywImeknjTpVM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ouBv0W1I+eRW0nj2G7QjNqWeLEQoBidBk0FDTmzIe7zgljKUtlqMpy5u57R+/syMdte7Ujpm8ykCQWj9HO4et517tq2IYa9oeILr06gXXjiQhf3aA6tnjoiiOuTFiU/9Mu/Z0hXKjRVMheJcgtcT/rcLb1BDrDt/mO3pWt9lHH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=h/xFAe54; arc=fail smtp.client-ip=52.101.100.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="h/xFAe54"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5VWeLz7iefBSLO2OVc2ypv5fQE22+1Z08DHdeMr6uI9PF5oz374AXzcXVYn9ODFcrSPAg3JT710akcq9pyD8ysqg70Luu43L6NkJxZEz72t99jVBrdYCEDjimVFRIS5K4TRRIBWKq8RlSFIr71tttuA7nnQ9nb4rimfyZzjsYQl1FBtTTwCruRPXroqifPoP1bWaX5pMVO0cl8n2JaACnj5d5ricsTFO+RoDGUZYMiq6XXh3GTTLPGPJUu3oqNQrIr2O+RCvhfdCDPwglldcfJEa9cxGHk5tTCqXs0KNv0KybWhK0bSpLAhH9ptY/x6rRwniwedblUFB66zgDP3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSV7WQoZjelVi4VoRD380/IlfflPZsOB+luFGDSVgjI=;
 b=DqswvNNH0+v97y1Fl9zJMmgN5xXCC9Th0R4tfhG0xwwUm9aWLTSaxlpYYb2UR+Gmhtvikcs6tt4zEJHnyPDhhCggzQCvVd403w7BHhHnoopdzUIFI5eiBggIOPG0bmINukvfyh1bWsBLZPgfXqhnIBRQfX6hzmhNV1LxW3ptfVf6zOMr/e9cZiAwtXXypR99Lnn3DZXRg9UOV9v+/EImUwmM4rit3vS0bV057Y9QOAeq45gyBkP0FvsbdhhM6uxM/urllL4f3FLsxgt9E/YQyW9z3ea8BkII0uq3h2ZdqdylBlDiokgZtOWvDsLxuymbQOIj+3RsZrj/U5piLTOBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSV7WQoZjelVi4VoRD380/IlfflPZsOB+luFGDSVgjI=;
 b=h/xFAe54oIowM5JosfuD9bHoPJcb10ofJGt/gOYjSMHMd5Ht+idELM7Nml5nuDG44Hwp445rJCnu+rIvPqXUk9ldxIwIchaxT35jkl+yyu/9gzcgZmD5BjmeqUVTgcnMQR4KUQprf3267oCC0vcJZIs002GHO9e3OD4OuOxErj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8993.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 11:36:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 11:35:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 11:35:59 +0000
Message-Id: <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
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
X-Mailer: aerc 0.21.0
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
In-Reply-To: <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: c74bb801-607c-4852-9c8a-08de7b748a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	xlRSg9F84w1IoKD4i+E77857PrW5x6Z6ZXGyZ68PBZ1JUcOpoCs+Y7QRTrcyZG7HBdLhYr4CLTJWqV7jT9+YmXQhKzbloqj4N/+YgOKFk5SGNlgIECTk9zQ75kE0UvgTCvN64g+FtCkT2MIb4Y5t3bcYaGa8MrOG02AUESaMzfoGg2e1JN64VqAdu82muXUo6uIPp2zsJUtnD5MJLD8Qhpwale4d4RfLs6n9/mtIaJfB4OrcdePTBl+cTy0XntU0alN9OfQc8hjkFfaAOhdt8afbibSfu7bwL0VYhTUmB1SeZpOjYYf0yikJdZe9dDYdTY8BskKcKJvNH9lMrEEBDlptZQ2C/oF+yAZMH1F3t8Oaebt/TLt9AtHVGp8n70ZRKWFj7C7FGjM8lL5OaR2eXj/uePmI2Z8BoLisKBI87ZB2KGEkFtxcjxlYK+M0xqg0o4WH69v2W01Y4ETtdoEoMVWdbg08UMvA31dSMlt7ovDLyfIquLJ+whghzgwQHCXXTVRciRkCeFeRAvoDZXOALdwN7ET5n3QzRqJ/GhK0+GTwXCysaQZQzFTKpT0pCVCXZsOhcjgCzoQeheE3ejj0WM+TTFRGxNPHFP0ZH33Uy5/jjmX820z5YSSW9aXzZ/pm2y4s0JV7BwP0u3Lc20ZKXYHrhGqBLUcGRU0cdP26diW8CioNKtdMBjcyS4cxlI0TYqqjeoOSUSJeITvgfipDFKLwbJOJHa3t6ZnePHvIzaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHlEK1pMVG1iclVDSGhIVk9NVjRvZzFUeUQwLzdYUG95TnpURzBOL3BvWlhX?=
 =?utf-8?B?elFralBSMG9RQkg3WWxFajVIWklxNUFlYU51NjJQZnZFYnlFQW9EcmU4Zkl2?=
 =?utf-8?B?VXA5UWU4bG4xUUc3SjYyWUU5N1VsVEI4MUV1S1dDNzdTR0lDRzZzWllKZ2xa?=
 =?utf-8?B?Z1IrZWdHemlWTnlmUEw5M1JYdU1nMk1mZnZmc0NRczkwbmdSME55NGI5cEFo?=
 =?utf-8?B?d2tvT0NCQUlodG1CZlRVR3VZRlZvWFJZY1l0WnlZc1lUcnhPMnNjeFk2YVdK?=
 =?utf-8?B?YWdBNHlNeGI2WEtKV3J0cVhzNVVWaGREMWp1UjRYOFpYcXlDWjNZWVZHUTha?=
 =?utf-8?B?TnpLQmk0bkw3eS9UOERJaG0zdHdZamlJRHVjWEZUYWNBVVdpT3hUaWc4Ylcz?=
 =?utf-8?B?TEZieTNJbGdzbDNYL2RTbWtyMDVhbnR1MS9BeW01VE9wZldoamFXR2ZYL1Jh?=
 =?utf-8?B?azNuUlUyQnVuSGlFUzNhM0taZDZVa1pxTTdOcDUrVWV0bEZOWHBYcUUxT3pj?=
 =?utf-8?B?Nk5WdCtOc01NbXJPb0JSdEp0aVRMcmlLbWVxdHJmcm16U0IxV2dBb1ZCcGhl?=
 =?utf-8?B?MHBacUxSOVdPenZvR0VsWUtTZmhVejhzMW12NFhaMEdLbW5DVjVhaVdXM2lD?=
 =?utf-8?B?R2tZSmxSeUhDelhGNDIzZG1wWFg1S3J6YjBhUlAwZnBrNE96N29NUzFrcDJ3?=
 =?utf-8?B?THNWaGVReCtBcUFUMytPRy9HdzBnVlk4YVJJSERITUhGdmN3VHVEZWZxNGgz?=
 =?utf-8?B?dXZLTDNFcTJVdlhnRHF0anllNEhvYjlxVHJYTUFsQjN0VnJwRXlXS04xbncr?=
 =?utf-8?B?WU9WUGxETmtZQlZ4Z24rdTZ5NmFWaXBydEdzTE1aaWc1WVlXYnl1MDV3UGFj?=
 =?utf-8?B?a0VvQjZwcy93Mlp4N1NFc2hIMjRxZ2dmZEpaTm1YUHNkV3NqaS9mY2tXQUxv?=
 =?utf-8?B?MFQ5Ri9uQkFTTG5qZVdGRmlzNUhEWSs1cnZQcU5sOVJSa2wwK3Vlb3ZEdmFC?=
 =?utf-8?B?TUo4ajZGK20rVXdINFRTcTVBQnZMWitMNUh5S21iY2FCMW4xV2IzOHVHQ1BO?=
 =?utf-8?B?K0dTWFdCS2ZMNXVld0t1Zm5NVTRlQVgwbGZtWnFHai81eGZmK25nOWh4QVpl?=
 =?utf-8?B?UVdJRHdHZW11MDg1bFpHS3hnSk0yeTNoODUzeUwzbUVvY21JZE5RVWxZNkRS?=
 =?utf-8?B?a2pyS0U5WnNZb01ObmVmWWovTVViTEppaTJjMUgwWEhRSkZKQ0s2dllGeXlk?=
 =?utf-8?B?WTJ5MkRkQ3loT2dleFNUOGdmMnB3RWQ2REo5ZGdvK3MxdjBSRzJLa21zaFVW?=
 =?utf-8?B?Tk55Z3V0enkyeEI3N3FRMytQdUtheWV3c3NST1FJcXUwTkgvZjVBbUdvbUh1?=
 =?utf-8?B?eUhWdXBGQlZ3ZGcwcDZRWDNmSXhtS21kUWFGenp0R09nQzZSK09Nd2hycHZv?=
 =?utf-8?B?R04ycDYyc2xEWlFiRXJSd0NrcFNENThKbXR1V1A4WUFnUmVlR0ZscDBJWUhW?=
 =?utf-8?B?NTVtVjRGOHNtcm11ODZOcmdnYVZMaGJEMTFiZ3p0ZGR1c3hCd0JjTGRiYm44?=
 =?utf-8?B?RWZWaGZqUnNxaDZZd2hkT1ZJWk9lVENONkJ2QTB6V2ZmM2ZkbGFaS0s3Q0s4?=
 =?utf-8?B?WEllSzhwb0pNR1p2dUxNNWtpZnhVYUxhSWZ5RS9ZOFZVbFdGbnZJckFKNGti?=
 =?utf-8?B?clQ0MnBvQWl1Qi9tKzBib3B3RkJWQi8xUGhySVpYZnA1MjNBWHppeUhqc3Q1?=
 =?utf-8?B?elM4SVU2VXJRSEFLTXRyd0grRDBDbU1jU2lnVGl3eTBUaGJGcTk1SmdJUHh4?=
 =?utf-8?B?SWFEMkVJQ1hjeTVNcDZacXV6S1pEZS9pUDBaOStodFQrYStGN3BhUHdWUndM?=
 =?utf-8?B?RVlhZmxFOWNnVXg5SzhyQzI3a0x4OW5Nb3AyVHRFcGJoZnJKUDA3dSs3a0Za?=
 =?utf-8?B?Qy8va2ZkWUNjdDk4cG10VnloRUsydFArdWl0d0c5ejhOQTRWRWVlcEJoNVpV?=
 =?utf-8?B?bm15enJvQlZWcmExS0prUjdUYnVmamVsWW9zek5jR0RkUm5kUnNXLzlJSXA2?=
 =?utf-8?B?ZUg4dS9Ndm05STROcTgrdFdReWI5cUZRS3NNUmlsUGVua0VJVXhOdU5ES3RX?=
 =?utf-8?B?TzlyTE13cFVxR0paWnRDWjNKTXVIMlFFUGtXbjIzTVVjMGgzbGtvZ1JzRTVC?=
 =?utf-8?B?ZGEzVnVaaWFTbVJrRm0rRFVBbmpQdmN0ZG1Kb3liM0lpUWtVc1FYc0FWQmRh?=
 =?utf-8?B?UEFvQ2tiRkRLMjNWTjY2MHVISmJDK1E5OHp5Uk5NcWllUHhFRmdiM1dpRU9t?=
 =?utf-8?B?OFJrTXJHaVdTWWJjUkxlZDhLaVhUcFFDZ0VOMG1GZVJTeTQ2bTlxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c74bb801-607c-4852-9c8a-08de7b748a28
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 11:35:59.8697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3P1CtXKEeZp7n1lE/Y/xEll4PJEUNwNu/3j13tMg6uk35gF/segshrsRq3S5eR8ZURyAaIz5a6BVSCwSbja5hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8993

On Fri Mar 6, 2026 at 11:10 AM GMT, Alexandre Courbot wrote:
> On Fri Mar 6, 2026 at 7:42 PM JST, Gary Guo wrote:
>> On Fri Mar 6, 2026 at 5:37 AM GMT, Alexandre Courbot wrote:
>>> On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
>>>> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>>>>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>>>>> Even for the cases where there's a PIO register, I think it's benefi=
cial to just
>>>>>> get a value without a type.
>>>>>>
>>>>>> I don't see why we want people to write
>>>>>>
>>>>>>     self.io.read(UART_RX).value()
>>>>>>
>>>>>> vs
>>>>>>
>>>>>>     self.io.read(UART_RX)
>>>>>>
>>>>>> or
>>>>>>
>>>>>>     self.io.write(UART_TX::from(byte))
>>>>>>
>>>>>> vs
>>>>>>
>>>>>>     self.io.write(UART_TX, byte)
>>>>>>
>>>>>> what benefit does additional type provide?
>>>>>
>>>>> Well, for FIFO registers this is indeed better. However, my main conc=
ern was
>>>>> this
>>>>>
>>>>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>>>>
>>>> This specific case is indeed more cumbersome with the two argument app=
roach,
>>>> although given Alex's nova diff I think the occurance shouldn't be tha=
t
>>>> frequent.
>>>>
>>>> It's also not that the two argument approach would preclude us from ha=
ving a
>>>> single argument option. In fact, with the two-argument design as the b=
asis, we
>>>> can implement such a helper function cleaner than Alex's PATCH 10/10 (=
which uses
>>>> `Into<IoWrite>`:
>>>>
>>>>     /// Indicates that this type is always associated with a specific =
fixed I/O
>>>>     /// location.
>>>>     ///
>>>>     /// This allows use of `io.bikeshed_shorthand_name(value)` instead=
 of specifying
>>>>     /// the register name explicitly `io.write(REG, value)`.
>>>>     trait FixedIoLocation {
>>>>         type IoLocType: IoLoc<Self>;
>>>>         const IO_LOCATION: Self::IoLocType;
>>>>     }
>>>>
>>>>     trait Io {
>>>>         fn bikeshed_shorthand_name<T>(&self, value: T)
>>>>             where T: FixedIoLocation +
>>>>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>,
>>>>         {
>>>>             self.write(T::IO_LOCATION, value)
>>>>         }
>>>>     }
>>>>
>>>> No need for a `IoWrite` type, everything is done via traits.
>>>
>>> That's cool but will only work for fixed registers. If you work with, s=
ay, an
>>> array of registers, cannot implement this trait on a value as the value
>>> doesn't have an index assigned - meaning you would have to build a
>>> location in addition of it.
>>
>> For array registers I think it makes more sense to use the two-argument =
version,
>> no?
>>
>> The example here is to demonstrate that we can add a shorthand version f=
or the
>> fixed register version that can write a value to register without mentio=
ning its
>> name (as a supplemental helper), and the basic write method is the two-a=
rgument
>> one.
>>
>> For cases where the type doesn't guarantee a fixed location like FIFO re=
gister
>> or an array register, mentioning the name twice is fine.
>
> It's still tedious, and a step back compared to the one-argument version
> imho.
>
>>
>> [
>>
>>     For array case, you *could* also do
>>
>>     impl IoLoc<RegisterName> for usize {
>>         fn offset(self) -> usize {
>>             self * stride + fixed_base
>>         }
>>     }
>>
>>
>>     and now you can do `self.write(index, reg_value)`, although I think =
this
>>     might confuse some people.
>
> Yes, in this case the semantics of write's first argument would be
> dependent on the second argument... I think that's a potential footgun.

I mean, `bar.write(Reg::at(10, regs::MyRegArray::foo()))` in your example i=
s
also kind of "first argument depends on the second argument" situation, jus=
t
with a bit more boilerplate.

If you want to make things more explicit you could also have
`bar.write(at_array(10), ...)` or something similar.

For the array case I really think trying to shove everything into a single
argument is a footgun. The type of value in this case *doesn't* tell us the
location, and the location needs to be explicit.

Best,
Gary

>
>>
>>     For the fixed case you could do
>>
>>     impl IoLoc<RegisterName> for () {
>>         fn offset(self) -> usize {
>>             fixed_loc
>>         }
>>     }
>>
>>     which means you can do `self.write((), value)`. I think this looks a=
 bit
>>     uglier compared to a dedicated method, but TBH it isn't too terrible=
.
>
> There is another potential solution I have played with:
>
>     https://lore.kernel.org/all/DGVJ7VQX3TD5.2UYW004QJPI6N@nvidia.com/
>
> It would let us keep the 2-arguments as a base, while letting us take
> advantage of the one-argument syntax you proposed in [1] and extending
> it to support other register types.
>
> [1] https://lore.kernel.org/all/DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net/
>
> I think it turns out pretty nice and the supporting code is also not too
> ugly. I'll try to send a diff a bit later so you can see how it behaves
> in practice.

