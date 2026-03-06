Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020073.outbound.protection.outlook.com [52.101.195.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED63921F7;
	Fri,  6 Mar 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803249; cv=fail; b=VP9/Bw1BtwUAt5BtkAyiJSIRz9IzlI49E8awsyaqnKg0R0mWQEC3GS1rAaAfP0CAehowJUWDK3weFKJr0CXooa1KpIBPaTQpz0YSmbNDRpV+XnvY32/YIVsy6QPHWar+LAm14op+sNpjYq24FsgEb+CkDnyDYqZUITCjh1UKIsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803249; c=relaxed/simple;
	bh=xQ7UTJ7zwFJZid2XZNOx1qlKQhMKfy7zdBT71afWxF8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TZW/4l8W3t8AT0L+Mm5g4Dvc976D+M+W0Xm/xUuF/MPPUD08vHOvw6WcR6MSb4uc2B2wi5u89K3En9DQlypNUL4YoMDVjmb+oFoinC++4xCeKp487V4/tVAS63EzI/wlnnbrxygf0Ov1X3G0CkLcVfh/Ubp4lFQOuk1A2m5Y3go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=x9dgS4fm; arc=fail smtp.client-ip=52.101.195.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="x9dgS4fm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2BGRj9NymJ8E3rce6ZHqIe6URFLiYAx0Doaq8fyd42UWhhKpx67VPR9yE6AQKOaYTCBISVp6tF6QQ4iaUyD+VFO1UNweOHg2HuH5L2sEsLxgRcKmcnnC7VU7RKkkkeuZsl/blXIG1E6X6c1BXwTDhiTGYhokgE8RvdQyBZT3VYrjzF5meXthw5LN++QssuoPaG8682NDor6EncuQu7lmHhFzPOfUhnFVjt+JK33+TNfgsC/fTKGnvf8nUqOASRDb1QCJ/YCOGkXAIt4FI/n5t6rztisJ+eSsul8OUBqkl6HY1PuW2rP3T6ovChRuCclga301K7Eqq3l4c0/cWgNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRHj+0MT2+7/Nccvn1JgQV6ZP9D5heVwfvpq2Iq8ugw=;
 b=eeHNoEM3sQJbs5RnrX2lDYX9xqDaow0HI0iCccjLkJW7ui+JiFNwx8I4YaI0nG9QqjurWP/cm5sdrONWi0W9+MSyjLIIdMY3ugvr3qegNBkQ/NZL/YasVouh9+MfZAvHbtgeyOXuCQMgsyPa85cRmiIIn5asmYntIqvs4/vO/EdW2/IUkeGJ+vqed3IL2j4LKHQ4V/kzF0NbBbPGqXYewPU+MxAV9Mxh/6bx4O1QB+g6e3i3ElXa99k1xOnmqr0afoQUcSnNApVwRT321S4onpePjJ9so/TBbcsFNoCCwRQzTH7+KY2pqHPe4kUoicNyTR2isHr1yPxl/W21xXth5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRHj+0MT2+7/Nccvn1JgQV6ZP9D5heVwfvpq2Iq8ugw=;
 b=x9dgS4fme9uuXV3Og2nNhGUQp5tBRvlaE8OjKUpkR8nq6sBgTrJAfmR19WlCLiWomKLG46K+LEWMWbHdiIVjKfKKkIFH7XYZywAy74K8elsrpxPPMFLIcV7N+p/mm4exq6zwMqs/ek7BXDW1FsXdeGUHbEy9q7EybAj+/a6DUB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7163.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 13:20:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 13:20:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 13:20:43 +0000
Message-Id: <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
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
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
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
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
In-Reply-To: <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
X-ClientProxiedBy: LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 972b7363-fbed-4418-919a-08de7b832bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	N0V0cWB+d1Zc0WVqH4PnB3esu/JlLB8UFpvfiNTHXe4y05xuzAXa5q34M3X7ZaY0y3Y+yGHNllHuNRwsTcDGfnVmymgU3YvztU2mDSbL8es44+upY/niEUVzeqycSuDTYQKc9d4esggvGGb6VL+9/qSi2PTuK3uicCSKqF/Dw6MsT7ZAnFNLfJDrYun5YFbURUy4+IEBSSO/l7MD4X6h1OoV3qZobhzatnHkvdY9vS0lYppswPR+mfYiVTHJYIXNZ98ln7yY2mpmHsJVv9kcDEcmSASgzuLbvO/Rf8Ya0UfJN6WH3HLQZkiQdq6AzVyo4V3VPy7zRlY0tSeqIPVa4DeEPZ6GEe6KnSF1C/5xArdhzZukbpiLtzAC2w469tWAH5Sk2bCG7/pwIvyrZZ03msnTNmjmL8fHbHCcxmQWhct7EfisfVBOMWEmYfbuWZjtulbgzMv0q25tdiQ00tcJaaTeBgFk4AZwWzk270ZEsa58ts/QJDUbkIhTbHQ95KTn3m2Et8er+dRFQnh1/dF1D3s/yoWdG4n8p/qs29ARaX/2BxIgvcKVKJT6+xmBrJirRj8lJeSFpYXMqdwTq0GI5dPa69/FqrQfpTdj+2328ud/Qx4Zvwvy5z/IhJGvth9tJPMdhxk+yf6A7gHmps6ToZn4FuvoW5XQvl2aj7llWMCxOwd11GXHZtoTNnnTNnUE6yXWZcyR3l8N4tsFMA9CMY227nTmn62qPppODkYqaiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENIcHg5cDZOU0NrNkUycjhjZCtqYW0zRVoyU21LSGd3Ym55UytiVjVLTldo?=
 =?utf-8?B?MElRemw1YS9hMjZOeWhqWjMrSktlbmJLUjFCQVBhS2hSZHBMbzlqZXgwZkdT?=
 =?utf-8?B?SnlzcG5Zdjh6N1l6c0lZUyt5L3doOEErUE9sRFpXelgyaWMzeEVaS0VKZ215?=
 =?utf-8?B?RDBTclFxTjVXMVZXbE40SVdWRU5DcWQzNlh1dlBDMkRHaTZ5dGJJZWs0WXVH?=
 =?utf-8?B?dWdDeEpWWlhLanBCRERRbnlveklncGY2ZmZHeEYxb2xTbktVUU5KRTQvV2d4?=
 =?utf-8?B?VjhzZ3d2NnVmc2p6UzBlbE5FY3h4Q0taM09RWXVQY2Q1N0JTZjYwbmRkdHNT?=
 =?utf-8?B?REV3aHo5N0VnWHViZDc0bkFMME9IQlJhNGtZa1BQUE9LQWNiZ1BIbUt6T2pr?=
 =?utf-8?B?UVFPUG84N3MrYkZDT2FkOGY0bHNrUXpoNUd2d2RVWTRLYmVadGVYaFRaYnN1?=
 =?utf-8?B?RlJZMHl4T09xRmdNSG9zMm03UmhDV01tTlYwNzJ1YnJZUHovOFlXcFQ0dTlY?=
 =?utf-8?B?UngwSklPdEJ2RnVKN0srVlNFenN5Vjc3ZzB2ekNESjZ2YnFVYlg3OWNPUzVs?=
 =?utf-8?B?NkJCV2xkUUVEK0pRQitwVFY5YTlOa3c2aHF5TERwOWttRU9VdkZ5TzRaWWtK?=
 =?utf-8?B?cFNTMDFsNTEyMTM5c0VicGd1SmgyNEVNeVpWZTFSa0V4cXBaT2g1QlloVlpv?=
 =?utf-8?B?TVRyUVNKZ2xEZFRTU1NSRGZyM0hQZW1MT2RtejY3aUVkWnkwK2ZrckNyaURY?=
 =?utf-8?B?UnVtSDREQkY1MXNmNUZxckk2VDEyeHMzZ1NrdUN3Z1JCUTVWMnI0YTk4THoy?=
 =?utf-8?B?ajdBVmZhTHorV0t2MS9aZDBaM200dDA3czZtSXVvenVHWlA0aENOejhYcnU0?=
 =?utf-8?B?T1NIVEczUC9oQTM1TjdUb3lQc2VSTFVkaFFjY05wVm5XQXh4UHh0WTRTSi9Y?=
 =?utf-8?B?OTJMeDh0NkpkMHl0eEhCcDl3em00RG1ONE5PYndUNk05cFhPUnovVVlLb0lt?=
 =?utf-8?B?MU0ydmpZczlIeWRpMVgyQlZ5WGNHZGVneFF4ZlZJRHV1NXZLUWtFWDJ0bFJq?=
 =?utf-8?B?VlQ0eFZRalhVZjk0YnpIcXRsN2lSUFN6RnVHRnZiZmlscWRVNTNVYkIzdDlO?=
 =?utf-8?B?MXJRM3BjbWxuU0VmeHJDTTVmQmI5ZXFMYUxnQys3Q3gxY2p6NTRZT0J3MWov?=
 =?utf-8?B?WGxBTDFqaTJrV3JhNHRTelFDN2VPbW1nNWQ2QWxiVHlxMGRIOHBvY3Vac0tR?=
 =?utf-8?B?UFhwQlVwbkJReDd5K3R3S05Qb3Vhb2tJcU04bm1kWGFsWHVXWFdwMStqQlEz?=
 =?utf-8?B?b1FiWHNDQ1JtanpZdUZ3UzNOSnBkaktFUytBa2p1YkdBc0Z4TEJWY1J4TjU1?=
 =?utf-8?B?dnpUNUFmUStzY2o2eVZLRTEza0syYjgzTXlJb055UEpUQTVMNUMxdHFMOXVs?=
 =?utf-8?B?b3plMXBwTmRnRGdhTC9RT2tVNDQvb2s5ZlVzOVJSb3h0SGZBN0hUV2ZyMC9a?=
 =?utf-8?B?SEJNenM2d1VuRFNHbDFKdW1VTlc2ZFJFWDNyYkc2ZUNtOWdJODRjbStMREUy?=
 =?utf-8?B?d1J2MzIwcmJJZ2hGWkFDU29RTHZzSkZXeks5N2N5b2xCeWVmaCt3Z09IRzh0?=
 =?utf-8?B?dnl6RHZZdjh4WWFCTjF5QWt0bFpMUFR1c1p0Ynkwd1ZOOGNhOTNEU2g1dmlF?=
 =?utf-8?B?TFNsTi9RMUt2WC9sQXdmMFJjWENnQjQ3QTIzZzV6NHFRMHdJakVqa2RBS3du?=
 =?utf-8?B?U2tVRURua1Z2Qzl3VFMrajcvcGJxa0oxc1poRTByMGZqMit0dHA1N1p0S2wx?=
 =?utf-8?B?Q0dvS3UvOFlWWnMxNEJ1eXRKZ2FPSWQ0WWRiT013dkRqQ1NTbEJZd0dOZTho?=
 =?utf-8?B?NUFxbmdSeUJ3djAwVkZ3eldUeFh4TkJJTTlLR05UazR5ZlZqRzZnWU9HNk1s?=
 =?utf-8?B?YXM0N0FpcUdIT256L1ZNZmMrTkdZb2VMUWsvVzhOcUlNQVM5MllKeWFrcW5H?=
 =?utf-8?B?RDd1cUJhVVZqdmFiN0QrSkxFTHE4SWdjeUVreXJvanB6cGl4M2RoL3ZjMndp?=
 =?utf-8?B?SHpEQ0prUGZOaCtiQTFPemRsNUJ6d09UelJxblNlSlFsOUxGTExoRlRtQ3N6?=
 =?utf-8?B?N0haZzNZN2ZsMEcydjRaMWdiQ3RtemM0MXBRaENWRDBNUGNTTGh4TnNOSVY3?=
 =?utf-8?B?MHdlTGNjeXU5Umw2VExQVFFTTm1WTk9zY3JQaUlyV2RJMmdUUFcyVHJlZkNL?=
 =?utf-8?B?aEJCbkxnVU5uRC8vNUlyb2lmR0Y0OEp2SmZ3dkZFcVhQUDczU1JqMTNXY3ZU?=
 =?utf-8?B?U09SYWFnNzV4aU5tVjJQTmFFMW5DYnZTNHVEenArd0VBSWMwQkF2UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 972b7363-fbed-4418-919a-08de7b832bcf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:20:44.0157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bogzz32Ey8n4BBZYDyGG/pidss17LFUym1VXLCts7Z8TmpUVQz62/+T8ktmBo3meOA9IjWvZ7yCK/z+cOEQOfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7163

On Fri Mar 6, 2026 at 12:50 PM GMT, Alexandre Courbot wrote:
> On Fri Mar 6, 2026 at 8:35 PM JST, Gary Guo wrote:
>> On Fri Mar 6, 2026 at 11:10 AM GMT, Alexandre Courbot wrote:
>>> On Fri Mar 6, 2026 at 7:42 PM JST, Gary Guo wrote:
>>>> On Fri Mar 6, 2026 at 5:37 AM GMT, Alexandre Courbot wrote:
>>>>> On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
>>>>>> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>>>>>>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>>>>>>> Even for the cases where there's a PIO register, I think it's bene=
ficial to just
>>>>>>>> get a value without a type.
>>>>>>>>
>>>>>>>> I don't see why we want people to write
>>>>>>>>
>>>>>>>>     self.io.read(UART_RX).value()
>>>>>>>>
>>>>>>>> vs
>>>>>>>>
>>>>>>>>     self.io.read(UART_RX)
>>>>>>>>
>>>>>>>> or
>>>>>>>>
>>>>>>>>     self.io.write(UART_TX::from(byte))
>>>>>>>>
>>>>>>>> vs
>>>>>>>>
>>>>>>>>     self.io.write(UART_TX, byte)
>>>>>>>>
>>>>>>>> what benefit does additional type provide?
>>>>>>>
>>>>>>> Well, for FIFO registers this is indeed better. However, my main co=
ncern was
>>>>>>> this
>>>>>>>
>>>>>>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>>>>>>
>>>>>> This specific case is indeed more cumbersome with the two argument a=
pproach,
>>>>>> although given Alex's nova diff I think the occurance shouldn't be t=
hat
>>>>>> frequent.
>>>>>>
>>>>>> It's also not that the two argument approach would preclude us from =
having a
>>>>>> single argument option. In fact, with the two-argument design as the=
 basis, we
>>>>>> can implement such a helper function cleaner than Alex's PATCH 10/10=
 (which uses
>>>>>> `Into<IoWrite>`:
>>>>>>
>>>>>>     /// Indicates that this type is always associated with a specifi=
c fixed I/O
>>>>>>     /// location.
>>>>>>     ///
>>>>>>     /// This allows use of `io.bikeshed_shorthand_name(value)` inste=
ad of specifying
>>>>>>     /// the register name explicitly `io.write(REG, value)`.
>>>>>>     trait FixedIoLocation {
>>>>>>         type IoLocType: IoLoc<Self>;
>>>>>>         const IO_LOCATION: Self::IoLocType;
>>>>>>     }
>>>>>>
>>>>>>     trait Io {
>>>>>>         fn bikeshed_shorthand_name<T>(&self, value: T)
>>>>>>             where T: FixedIoLocation +
>>>>>>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType=
>,
>>>>>>         {
>>>>>>             self.write(T::IO_LOCATION, value)
>>>>>>         }
>>>>>>     }
>>>>>>
>>>>>> No need for a `IoWrite` type, everything is done via traits.
>>>>>
>>>>> That's cool but will only work for fixed registers. If you work with,=
 say, an
>>>>> array of registers, cannot implement this trait on a value as the val=
ue
>>>>> doesn't have an index assigned - meaning you would have to build a
>>>>> location in addition of it.
>>>>
>>>> For array registers I think it makes more sense to use the two-argumen=
t version,
>>>> no?
>>>>
>>>> The example here is to demonstrate that we can add a shorthand version=
 for the
>>>> fixed register version that can write a value to register without ment=
ioning its
>>>> name (as a supplemental helper), and the basic write method is the two=
-argument
>>>> one.
>>>>
>>>> For cases where the type doesn't guarantee a fixed location like FIFO =
register
>>>> or an array register, mentioning the name twice is fine.
>>>
>>> It's still tedious, and a step back compared to the one-argument versio=
n
>>> imho.
>>>
>>>>
>>>> [
>>>>
>>>>     For array case, you *could* also do
>>>>
>>>>     impl IoLoc<RegisterName> for usize {
>>>>         fn offset(self) -> usize {
>>>>             self * stride + fixed_base
>>>>         }
>>>>     }
>>>>
>>>>
>>>>     and now you can do `self.write(index, reg_value)`, although I thin=
k this
>>>>     might confuse some people.
>>>
>>> Yes, in this case the semantics of write's first argument would be
>>> dependent on the second argument... I think that's a potential footgun.
>>
>> I mean, `bar.write(Reg::at(10, regs::MyRegArray::foo()))` in your exampl=
e is
>> also kind of "first argument depends on the second argument" situation, =
just
>> with a bit more boilerplate.
>
> Not really, `at` is enough to know that you are accessing an array.
>
> Whereas `write(index, reg_value)` doesn't give us any indication of what
> type of indirection (if any) we have.

I  mean not sure `at` gives me that impression at all. It would just let me=
 know
that I am accessing it at a different location. If you omit the `MyRegArray=
`
part then there's no real indication that this is an array to me.

If `at` is only for array, how would you represent the case where the same =
type
is being used in multiple registers?

>
>>
>> If you want to make things more explicit you could also have
>> `bar.write(at_array(10), ...)` or something similar.
>
> Is it possible to generate an `IoLoc<T>` without having `T` mentioned
> anywhere in the call to `at_array`?

Exactly same as the `impl IoLoc<REG> for usize`:

    struct AtArray(usize);

    impl IoLoc<REG> for AtArray {
        ...
    }

>
>>
>> For the array case I really think trying to shove everything into a sing=
le
>> argument is a footgun. The type of value in this case *doesn't* tell us =
the
>> location, and the location needs to be explicit.
>
>     bar.write(Reg::at(10, regs::MyRegArray::foo()))
>
> "write the constructed value at the 10th position of the `MyRegArray`
> register array"
>
> What is missing here?

This is completely un-natural if I try to read it with fresh mind (try to f=
orget
about implementation details for a second).

`MyRegArray` here is a type name that is a bitfield and not an array. `foo`=
 returns a
single value and not an array. "at" here is saying that the register is at =
a
specific location and doesn't really indicate the array nature.

This is why I insist that I would prefer an explicit location

    bar.write(REG_ARRAY.at(10), Reg::foo())

would have no ambiguity whatsoever about user's intent.

Best,
Gary
