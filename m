Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792423854;
	b=IGsAOfl7L3VWSHa3LcX4tssymp7Ct7lZIn7Auzkkmt1O9fYPAw2osqfQDjJwKmGf4xxa
	 bBHntNgK5hfo18UdXFmEm2kd7jdsDYcn1ZhWR9lHVj7bTeG77/AvyCQPhtkSlWlohUKug
	 pUOAarHWg7IWeHxFW1aiwr8rLZgX4M/+MJOH0nZGjkC6GzikQB0T1QvriBY1kqjwC6m4s
	 ZNUeWHnssJm5mQwOfqqatRhJWraL+pWfK3iQrEkT1qnV2lnwhTvzHb4asSbRFHWNQrDRD
	 4NjSaVOq3DqdNVIH08hlM4i5C6vyDb873dSifVUpiOx4h4G+shPvivM0r2E80c4RGow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423854;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EVPt1VNtS6W72JEnP1b4RjqqniLorVUyva/9LYhzXl0=;
	b=zKftek2e0j2T8QOLswGw18M0pF5kX/E+w6lxKm3DHwccBTH+59GNpljZha+A8nENFWLv
	 figQ60UbhCvXs0U7QPbZbNbFo05LPtxWW1AxWx7nMIZfgcmYxuk1QvAmnLK+NANSpwQgj
	 SWPlru0SzwIskS47E2+wX68PFzBSldSLbIjEyAldO/OPKhqE7hC9pdDH3IWd7AbZuAAMi
	 b1SdizYAx6avRiaaVHwRhOo6KQuhtfFL1bVppgxNqGDggS5qJHfmJPptIGF7+cIOHopar
	 qQSlTNReBZaAJKnDPfm0UElImrDK4E7enhVx+Z57T+plAsZOVIJVe//ZVL2x3OvadCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=LEWBqcSt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.103
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020103.outbound.protection.outlook.com [52.101.196.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5129060AA0FB;
	Mon, 19 Oct 2026 15:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5129060AA0FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=LEWBqcSt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guaaP90aRnh5eKnuunV5t7KrvvsVWvr5G9V9rzXhlqddLTl5Fn96Ts+B752MR5+PIlt6WCzxliyn03BDQzUcd8m9+m1dqnwgoG7pzl/1/4yl7Y+ZwjGShiWmxshXWuKyzmaI1cUv4pExWMKxPS/tUnzDq517vJ6uacwpX/a4adj5R7665sJDhm6K6mbte4/hFwlMiWJodZmsUBNl7q77QnDQyijsns7kpEIFYiPecgPPcn6uv0wOnxWC5HcKUPCCBkAA0+msuZOUhulF8g9sI32gEY0DFVV+WynIiuq1S+QCT1wE90NHbusPITkeN2YtPyH++WUhwzZKCMFAzJsPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVPt1VNtS6W72JEnP1b4RjqqniLorVUyva/9LYhzXl0=;
 b=xGxl5dWHfw5UVR8uW35rbq/h6l1/3K6lH3H+TI0XlMF78bnwU/t/6dyemzaigoYlGdNcdyTzTrTJhICZhaUAvr92LQgmXn3dBx7AktHyezOFLhm0wf9iDhE9RV2Kfp+1c8CJrsqfcX2FTHHFS3uShpkl3GJk6P1a1bJIFMSwu5R9n5vSeYO/Y3cS4kbAkcq50mPfttBVHQiyNmg7ZYu+IosoJd5DAO1PBKv/5tdyXjDfACcUj0dt8xZCJ+CeFURVyZ9kTSzyh6LrCz9xPz/O4FT7GtVi/k6YaLQxSbQtaattY8eBWIFburXf8KKSuzQSqPzzaJLYAUDwsPSvmqHgnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVPt1VNtS6W72JEnP1b4RjqqniLorVUyva/9LYhzXl0=;
 b=LEWBqcStKCdN5N3dMnLkSO2RSixN1AARcqsLoe1jh+Nf3L/qY1+tXf8fYPHZPP+VhXMFfxtZfXv1U8uVdGu+LfQwBcQY0kGDzEfBJW1Ek1F5fIyompjgk9PhjMaOdesEsGBoyDqDmwz2oaZp4TdSfc2qqDiGU9b5pS7eKAI5x9k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:273::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:30:50 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 15:30:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 16:30:50 +0100
Message-Id: <DM8X855NT5NG.2MLWTN9AYVBSB@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: sync: Accept errors for Lock payload data
From: "Gary Guo" <gary@garyguo.net>
To: "Philipp Stanner" <phasta@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman Long"
 <longman@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Alice Ryhl"
 <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261016120926.1213105-2-phasta@kernel.org>
In-Reply-To: <20261016120926.1213105-2-phasta@kernel.org>
X-ClientProxiedBy: LO4P123CA0617.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::18) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 86282535-bc43-4d3c-2508-08df2df5f4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10070799003|18002099003|22082099003|921020|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fhiQdeY7i/M6yvYsmKq1OJSftvGar+XYKVjZ+gxTAO9XgqMW2kE/+L8p/1U8dvlV3lA2cObIfy6U9OwHOEBi3+pQRiqjRzBNZOwf3AA5wMQzizzwIt5eKxfx50TLJkINANlyDdECTNVxghppXDkg8V9ocbH/lXzF1SGOcc/69Q4UXY+KOi14YjApZJMhRFg8DaGVUyfwDY5WtV7ZrFPrdfDe/wjeoHMsjbiQCiLLlw/B+qHeDouDRnV+ag/7M3YFZCSKYDqBT4vyGsaj4CjOmOF8x+hHXzAHayrpCK2QaLSS9ZmResFQ8mGUwTzWhbGTAH21lHRQkgf3IfodHq19tF/fCAcc6F5DJ6aRB8t6dJfiV2gqzFyW5HGHpCzIw5L17kE8LVzdo23u93iqV0dBVVfOeCx9viThSZUMfM9kj/yZzFo/81iOmYyma6f+vdtMlg9hs49GTDe8d3BbTtm+hTaZls1QnCR1yul2GQtyqq1AFAHcDMh8Ccbt5rmh/ZCE9/t0W3593bNxFztmFS8DFUlmvZOmS9t23wwsQ6ebsinxOj9irXGMNzvP8LvOhw7t0In+dt7tHjsLMM72k8uqfE1f9FWyR2scNsNwYzaaNCZU+SlKW+6mh7avpkMmsS3wagkfI84q5Zh3Gl/q5zxtwMZC8kPcXumZmEbjXkTikGI/8b1Entqv1BMH7EOAbugywd386lxagICQSU4rLcWOjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10070799003)(18002099003)(22082099003)(921020)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGFRTmJtK1NpNDhESFFNRGlyUGJSRG5lV2J1Z0tjK1dacU1rV1NjaTFRVnZR?=
 =?utf-8?B?SkRnQXJWeTR6SnBZbURkT3g5eEhKbTZVSEJOYkh1NGFoUkpDMmxCY1NCa1pn?=
 =?utf-8?B?eXRJVy9EblN1RFRvdG5LVDJtcXRGSW84cEJGaEZHT2FrMHVocC96aFhpKzFG?=
 =?utf-8?B?bzNUWFZuZ3J6OHVEd3lDWnduMlNsbVZyeTdKaTJuYUxmWHY4dEZCVzVpa1hF?=
 =?utf-8?B?cWk5RmdtUVdqYmNueU9vMHQ2QTFPOVMzOGQ2dEdlQkp6bmFxcndZYVFFRCtF?=
 =?utf-8?B?aExHbyt6OHhlT2FNUkpqdzVuRnV0eC8xazQ1QUFLRUdONHA1cGdPc0hnay9U?=
 =?utf-8?B?N0JleTQyNnRwYkdVUlBsbFFOK1VTRUdpQmVFY05UN0I5WkZoTDlOK01sOVVu?=
 =?utf-8?B?YmFZOHFqMzFBbG8zOVFqWCtzRFk1N005bmNtTDNBQXVDQUVmTTV6TWZRVnB3?=
 =?utf-8?B?Q29SbFZWcTJ6TzZnNFFVVlZXWjRVdW9YKzlidDVDME5pYW13bUFKSGVDYVls?=
 =?utf-8?B?Y0l1eHplRzlaZktkMDJpU0xpY3Z0ZWNUQzZPUFR0WWpCU1BlZnpicStJc0Fh?=
 =?utf-8?B?MnJjQVJiZy9HcXBmMUhJVWtjY3ZJdlFEMFhUS2R3YlhGVVQzbUNNVzdPODho?=
 =?utf-8?B?SklwZ2FLYkFGUjRmQnE1UDVoWDJROUFwNzJwTjBEUHhqY0VnTnlpN0ZEdFI1?=
 =?utf-8?B?NzVBM0t6SEFQUGJldzZWVnlvbm1hYTVkK09uZTVsMVltNU4rVGF6bUxrNVZ6?=
 =?utf-8?B?WEMxWFYwams3ckdFVFhLdUdQd0lBZEw4YWN2dE4weDRldnplVUNETXh2TnNq?=
 =?utf-8?B?YjRac3plQ0d4eW1MTGpNWUJGajl5a1BZeHRsblYvQUhXd3RJenFpUjFqMnJJ?=
 =?utf-8?B?QjBiOWx4ZHE4NzhXRkNKMXFVeUptYlZlSjBnaWtzT1Jjd0Q5VHBjMnhyN3Nk?=
 =?utf-8?B?alVXUHhPbmhGZENyMlBBTG9oc3JFbmQ2ZGFMRWg5WHErVm5pL1FQMDRBekdS?=
 =?utf-8?B?d3VPdGk1Q1AybjZNTnUvSFE3TCtVWnJOOVhGRUNTbWJ4T1FLckZiK0trVDFp?=
 =?utf-8?B?TzU0SGRLZjV1aXErc1lnaTdpaE9rT1BHVGhCOUl0TS9wSFVYYTFRWHoxYjcx?=
 =?utf-8?B?U0lUS0Jid3U5NHpCSDMyaTQzd2tQbVQ3c1lXS2xKOHRvLzJhczYyaGdGZks1?=
 =?utf-8?B?Mk9Mc0tVb28yUWVxZWRINEppcXkzS2lkei8wYzNVRmJBNkM2bkpQSlJYa1lq?=
 =?utf-8?B?UEZDUHg3amZDMDJRSlRLV0lCbjhYWStFaUdObVY3SkNzOVVVNXpZWEt0TFJR?=
 =?utf-8?B?ZzVaemt0eUdKcE9XMnpLRDNpRzlkWXo4RUMySW5UbURtZ3VWZUJ0WWptNytY?=
 =?utf-8?B?NFRKQkhCSGhNRVBtcWpjbkp5T2o1b3I2ZUZIMjUyUzIzM05HVVhJdjVsVkYz?=
 =?utf-8?B?OW04eVRtS0UrSkFQZUMzVjVTQW53b045SVJzbHQxOUt5aUEyRUVyZ3Qzck5p?=
 =?utf-8?B?ZExkcEMyd1ZPM3o4emNHWVV0ek5ybGRCaG5hdHJtK1Q2V1dEM0Yzb3JQc1ky?=
 =?utf-8?B?RElTRlY0dE4yMVRSMnFEeGpidGdoOXRRdnZqTk1vSGo3anczVzFOMjRSbFdE?=
 =?utf-8?B?c1dPNFRKVmJHakduTmJEcVZ2Z09LVlc5N20wVDNlVFppOFhYckNUMkUwRE1J?=
 =?utf-8?B?dGl6NEhBVnpUNGVCbWJTMHlWYktWdklGSjdDSDhjV29QYXJvVzlnbzhicDB1?=
 =?utf-8?B?eVhhN2Y0VFpsQ1VmTTVUL0wrWXQwdVZRVEVkMGRWb3VnLy93TXVrSFF2ZHRW?=
 =?utf-8?B?Z2wxSXljUUxFZVV5RUpDdlFsZkpOZWlmd0RFclVJYkljL1RJeDZNMUJweC9C?=
 =?utf-8?B?b3V1RS9weE51ZHlOZ3l4NHpuMStCdDkzSURLMWxyTnNVQUpUTnZHTzV6YjA0?=
 =?utf-8?B?amcxcU1ldVZtNjFTVWU2eTB5M096S3BPK2VXdWM1WDJodSs5S0V0SmkzRmNn?=
 =?utf-8?B?eWtsaXo5QUkwanM2VEQrQjF2SDBmditmNTlOVnVBZW9TWkRUdkhpb2FMUUpL?=
 =?utf-8?B?ekI2VFViTnh6OUh4aENwdHZCdWtCd0poK3p1Y0M2aWJ0bVFLOHFBNjZacGNB?=
 =?utf-8?B?dWttb1pvMGJsMWVzd1FxSzJUOGowSW9lR0Rxbk5halBCK2RZdnJlaGtLTzF2?=
 =?utf-8?B?Z0dwVmpkUXNENFp2YXdiMjN1OXJ6MG5xTElWZnpJVlB1bE1ZSUdkeWUxQzcr?=
 =?utf-8?B?R2NxeG5VYnU5cUpDa2xKekdZOXZsL1dWWm5QWlg5MVBVOSszM09nWTdmUFZE?=
 =?utf-8?B?TkV4WGhaczhKUFBvcWpwOGkxM1JlSUNMZFAxamFoNGRnejhtdSs4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 86282535-bc43-4d3c-2508-08df2df5f4c1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:30:50.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASjYt4wdzZuZ3X9FOxvaiamxOeMRk0qcOeEYS9SlI4e9y0cJBj3xsx3+srfdhAUoF9DLE/2kn5xJOvmMNl6lzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6279

On Fri Oct 16, 2026 at 1:09 PM BST, Philipp Stanner wrote:
> The `Lock` baseclass currently does not allow for fallible user-data.
> This can cause conflicts when used with other primitives, for example
> when a lock shall be pin-initialized with payload data that is fallible.
>
> Add support for the lock base class so that it works with
> try_pin_init!(). Adjust spinlock and mutex accordingly.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v3:
>   - Vertical formatting for imports
>
> Changes in v2:
>   - Don't import prelude in doctests. (Gary)
>   - Keep using pin_init! over try_pin_init! in Lock::new(). (Gary)
> ---
>  rust/kernel/sync/lock.rs          | 23 +++++++++++++++++------
>  rust/kernel/sync/lock/mutex.rs    |  6 +++---
>  rust/kernel/sync/lock/spinlock.rs | 17 +++++++----------
>  3 files changed, 27 insertions(+), 19 deletions(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024..5bff5228ac16 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -7,11 +7,17 @@
> =20
>  use super::LockClassKey;
>  use crate::{
> -    str::{CStr, CStrExt as _},
> +    str::CStr,
>      types::{NotThreadSafe, Opaque, ScopeGuard},
>  };
>  use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
> -use pin_init::{pin_data, pin_init, PinInit, Wrapper};
> +use pin_init::{
> +    pin_data,
> +    PinInit,
> +    Wrapper, //
> +};
> +
> +use kernel::prelude::*;

This should be part of the `crate::` import.

> =20
>  pub mod mutex;
>  pub mod spinlock;
> @@ -126,13 +132,18 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for =
Lock<T, B> {}
>  // data it protects is `Send`.
>  unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
> =20
> +use core::convert::Infallible;

Should be part of import above.

> +
>  impl<T, B: Backend> Lock<T, B> {
>      /// Constructs a new lock initialiser.
> -    pub fn new(
> -        t: impl PinInit<T>,
> +    pub fn new<E>(
> +        t: impl PinInit<T, E>,
>          name: &'static CStr,
>          key: Pin<&'static LockClassKey>,
> -    ) -> impl PinInit<Self> {
> +    ) -> impl PinInit<Self, E>
> +    where
> +        E: From<Infallible>,
> +    {
>          pin_init!(Self {
>              data <- UnsafeCell::pin_init(t),
>              _pin: PhantomPinned,
> @@ -141,7 +152,7 @@ pub fn new(
>              state <- Opaque::ffi_init(|slot| unsafe {
>                  B::init(slot, name.as_char_ptr(), key.as_ptr())
>              }),
> -        })
> +        }? E)
>      }
>  }
> =20
> diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex=
.rs
> index cda0203efefb..38d8fb9dad5d 100644
> --- a/rust/kernel/sync/lock/mutex.rs
> +++ b/rust/kernel/sync/lock/mutex.rs
> @@ -49,8 +49,8 @@ macro_rules! new_mutex {
>  /// }
>  ///
>  /// impl Example {
> -///     fn new() -> impl PinInit<Self> {
> -///         pin_init!(Self {
> +///     fn new() -> impl PinInit<Self, Error> {
> +///         try_pin_init!(Self {

The example don't need to be changed? The existing API would still work wit=
h
`pin_init!` with just `E` inferred to be `Infallible`.

Best,
Gary

>  ///             c: 10,
>  ///             d <- new_mutex!(Inner { a: 20, b: 30 }),
>  ///         })
> @@ -58,7 +58,7 @@ macro_rules! new_mutex {
>  /// }
>  ///
>  /// // Allocate a boxed `Example`.
> -/// let e =3D KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +/// let e =3D KBox::try_pin_init(Example::new(), GFP_KERNEL)?;
>  /// assert_eq!(e.c, 10);
>  /// assert_eq!(e.d.lock().a, 20);
>  /// assert_eq!(e.d.lock().b, 30);
       =20
