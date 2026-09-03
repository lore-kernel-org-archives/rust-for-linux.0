Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021083.outbound.protection.outlook.com [52.101.95.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6C4E3ED5;
	Thu,  3 Sep 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450387; cv=fail; b=JWV5UZYDDLO7YT6fotn746l4lwRd37iUFxCAflnBvspU5lTvVXbuS55lcMfBPPR7vgQVfSTTSG4aPpfE4SixyHraXPCCwyWiKzMMEcQcGo+Hd+q6ItQrcRLNb9IdRM2X5XCin9i7rAPXgINm92/6g4RVwOUeK+j3lmi4PAiBHgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450387; c=relaxed/simple;
	bh=Y46nf3SOMX2fuyUk3AOAj3Fha8dOHJXq+NGE+b96oUo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=a+H+xESVCwlH719w6ceRhkWZZ81nfcRpZhIzMpBp4bdlceUNsCXorxKujDmwFeXt0IEqca5LosDVLVrpfrjpLHmi2AUWzEOXH5+YduZIbyPpSMJdebO40iMlf381TMCDMGbgvlvtz/NpdJ74UEAFToYFz6YosmCXmG+GnvmUosw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=blcC/QLq; arc=fail smtp.client-ip=52.101.95.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="blcC/QLq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGzsDW3U3HAIOTrL5WhgQqOdg94IfplNP2/TczaIU7SM97vAn1fB1Csbt90T6oYPBJmSoRTDfJibGuiK9YD5KKd51r0A+EPS5boerTpl7gtXRl2NHyRuz0Cx6o5ZLfY/tvg2kYecqddPJKnvya37zcQdfnuA37r7G0yv5YFuXjca+ndRZNycvEnbQqEsJUog7OcmQAbRtG8hZOj/1SHdr/u3OmgQ3cOdD/nwMJI+3KjdzXLuIiG/Jh3woXUKYfi7j9zlzhz4A63jAJA2/sz8qHJbm98Ym4zhy/XX+xxrokcG0OSrKHtDhp89Tv083oVNNtylcTh9MgsTGcidDf0nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ttue9hZ2BckoFpSSWVH0yM8wqWB7X3/2w6D8L9c+SLs=;
 b=xfiOIhtikK82EJfbBPiT5TxtqSPxrUCzbEtt1zo9IwWFgdRLMLKLpMycMN6iTUnlc3a6QM3Gzs6sYKKf74v+4jzNT8u2oocO/qZi3GjQ4j5eIzrKlCN2orwgGstKEE19myQeXLuCErlMBdoU2ROwlgdevk8BKykwcKLF4DDQJjz8Q7XoHY5ZrcpOYbJkJEtP9rwMcLyazMS90k/7T75iHpAhY+avSDZeTkqR9TI02H38RtjSfz9K9CCO3ThGcY/YPb/0WnMk61MXOIjv8/HKBrkPR2+CgZPaJL46IHGl4IFLCLpERuRzJ7uGGfW3nCowH+MWwWL673G5bAvjmSIXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ttue9hZ2BckoFpSSWVH0yM8wqWB7X3/2w6D8L9c+SLs=;
 b=blcC/QLqDPC0qFlcZkkz9ldLy4qw2cffYGzpw+aIvsqtZfmVL8OutDBs9Sd8epdAt6/w04gNFj3eRSLgLrC6LuYMkJU/nDHJcrcKgmcYhp1PydaIJMbkBKbawIcozk0jlvnQbiyJd5KQSbH5r0qDhB0Ia9j8YzRLQAf3zK5qru0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB7408.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:46:17 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:46:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 16:46:17 +0100
Message-Id: <DL5SQWU5QH9S.1F1V38FAA5Y4Q@garyguo.net>
Subject: Re: [PATCH v2 0/3] rust: const_eval: add a mechanism to do const
 trait calls
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
 <CANiq72mgqhjAYR-a5gSnMjK++TVc1n6RFpj=Go6QqXtQRX3=9g@mail.gmail.com>
In-Reply-To: <CANiq72mgqhjAYR-a5gSnMjK++TVc1n6RFpj=Go6QqXtQRX3=9g@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0666.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b35f34-a92c-4d10-2b5a-08df09d27e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10070799003|4143699003|10067099003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OeeU2t+byxE+VEaZXApoLoKCQTNsKm8g8KyGaSRRs1lUURGUeeX/9mSow8RD865zJVXUUsyOrUH2hSKMJaVU2iOLTZzGwEtTUCYkUK+fZtPKdl3p3dwRocQHEvLESukGrgVOsmyAN6L044dHcwakNoiLOB16egTbv1ZP7zmxmisHbp4Q7MgxV01Bj65kM+KUArwpffcLMNdhPcdSBEtuGlwvdMgbMljbKupoXQzHg3CbDdNXauU7Yw6yMp39yJGKynepNHDrbaaNScZqvoA25hD+dNfTMeCnOuExFeeX1OLxwlpNbxfqxVD44gQxROFMKPBVnfgBDCUyWXtFN89IiFKqi4+eH82pSDvEB4v8wdiDASnnyFLqXQJEtp5gCCjymxcpoZzyxxLkDclT+RxvFAY5zNO2mYr0CiTvTErQfLjNsJ1NoL4VfggWqSe95FMyBXLQybb5TggG0T9BK3gxLkGxtlLML+keue5kc1BqAPFXqLuWA78XVxlVBCydDIahOI+FAk9FuOmefIWVJjrk5rRRvL2aLlGmqw2Y7AKpGvAHZ/t3kpGiBXPmziTX9s/9FVP7Jr2xrCaEVnXd1yxYGsr0WhjuS22IooL6LmsioQf6AsQm7IAQ33M3piHZLfKUkGwLtsFgNqji9tswF4LpbG6YxvBDGJqj7m/VtsRSZ9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10070799003)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3JTbDM4SGYvNlFJay9wRldWakhEdzBYV1grbzdWdCtETWgwSWRhYllhWlQy?=
 =?utf-8?B?ZTJDVFR6VDhha29FNUdTU3lndmRsemovSEZMeHMyREwwUlN4c1EzMytiMFl6?=
 =?utf-8?B?QkJyU3JJOHNQbkNHejhHY09iNHQ3OXJXZmtKVUhsdm1LdDA4MlJzUm1UK3Ra?=
 =?utf-8?B?VHc4TzE4Qm02RHFLd2grN0tXaEdMa1JMcG5xcHZEWFUvWWlEczZkbEhCcERP?=
 =?utf-8?B?K2hhcUFSU2R5UndIRitWSjJoeUFTKzlnV2wwQ29OM21YQy9LTGJtRE9wdG9i?=
 =?utf-8?B?aEwxemRjcW1vN1MzcUNFTnQrRGdZK0JrZzdpMG1aa0x4bk1LdlI3dmdCdWww?=
 =?utf-8?B?dGFEUkQvUTdyWGZoQVViaXgrTVkrMEhqeEovSGIwK043OWJCeGFXaWdkTmlL?=
 =?utf-8?B?ZTB4Uy9ad3NZbUVBTVFpL204S3hTcjRkMnl4b0hIQ1pydkZWaTlzVmlMYkM3?=
 =?utf-8?B?bkdBMXJhOS9JTktPMDBXUlFUVjlCQWRYTlNDZHNLUlVyM2RvRCtSUm50Q2ky?=
 =?utf-8?B?emk5bjdnSVVKdmIvb0YzREF2UHBZQS8vYllkeUM4SUxZTDVtQU91NlpWZ3hM?=
 =?utf-8?B?cHNMbVh6K0hYUDhRSnJ3V2Z2SnhCVVcrRllWN1VYcU52QVJ3RFdxdG5qejI2?=
 =?utf-8?B?SDNwNnJ4QkV0L3Y1b25lWElSWC9xV3BlUU9TNU5xYjQ4SWNmYXJpUmJhTlFW?=
 =?utf-8?B?TW9neGx1UXZ4OFBORHZ1VjJyWHZHLys1L09rNHhSOHRpSDlwMXR6bGFOZktt?=
 =?utf-8?B?OElGWmkyOFBuQjNORlZhalBVSnptM1k3TGJQSVl4cFdoNmlwQTBoSVU3elp3?=
 =?utf-8?B?WEJiUmV2OXhJSHIyYTFJaFZER0JnVEdxU2FLNHZoZ3QzcVZFS3N2bHBTR0dv?=
 =?utf-8?B?REJ3NGZMTXJuSlIxRVhDZXpQQzhYQVIydWRQanJPUVdFcFFuTEtNc3ZpbzRw?=
 =?utf-8?B?aUw5a3lhNjlVNTgyNXJ1TU42aGowWk55N3YvaHpEMDhFQ3Z4eGpNM1BDNTBj?=
 =?utf-8?B?RzNxLzJkTzJVeG5MTU1yM3R4QS83TU1TR1ZjWlZ2QzNWTHc1d2NFN3g5TzVE?=
 =?utf-8?B?MSt4NUhFWmd1dmFVKys2d3QvMkhLbTZLZ0I5MDdvTjdaaHFUZDR4c1VlR0sy?=
 =?utf-8?B?am1JOXE5MWZNSUVMU2haSko2bVo0dUpOTVowQjRMUWFrbWMxUFRwamtjRFJL?=
 =?utf-8?B?K1VRRDh2UGpZbEYyd2l2Y01MRHhzWHU5ZE0zVjNGRHBobEM4OVVFL2tmSlVO?=
 =?utf-8?B?U0xHU0w5VXRIS1AwTmtsekN2b2c3RFZ5enA2UkQ5NnBVYzNmb29FaDZvZU9r?=
 =?utf-8?B?QTBOUDhOb3FVTnN1ai9CSXpna2tlWkZHc2FOODNaT00rY0VZcmo1OE0yZHVT?=
 =?utf-8?B?cy9rWGlPaU1ITUtUV0diR0xzSDBtWXgwSDRRVXBKU3BKaDJpeXh0MjdtSllp?=
 =?utf-8?B?MzA1SytmNjhsMHJlclVEcmtYY3I1Y3VCWXdMR0tTOU9KdzlxR2xaNkZ5RENE?=
 =?utf-8?B?V1VJcE5lcjVlNkNTUkVMbXlzWFM1QXRTNG1kdzlBbkt0VmNCVTdrYlNtdUtM?=
 =?utf-8?B?OXAxaXBYSXZIVG9pYytKQ2tnY29EMytRYzlmNk5EVk8xSGRhSkpVQVRCNlpp?=
 =?utf-8?B?U05UUytxbm05UWJlbEZOeVc1bk1tS2FJdHBJM0JsaUJ3dkRRZGUwQzVIclIv?=
 =?utf-8?B?ZENHRG9vZ0ZIUGlGbklsd0JVZDVsQmtiMmRPTE1QZW16Z1Qvdi9zall3SW9a?=
 =?utf-8?B?a0c1MkhtSzhQSVlZdElieElnVlo5Nm91ck5hb2IvSHNWVURWeTZUaUM4SGZj?=
 =?utf-8?B?VjhkQWZsQ25qY0ZyWVpTK2hDdGo5OUN5ZDlNalJkYmQ0V2FTTGVSSkU2OGp3?=
 =?utf-8?B?c1R5YWdKeXltcDZBS1JyQmNoSjRBbVpBMUo2Y3c2ejZSKy9rbm1WaTRiNkxm?=
 =?utf-8?B?Q2dnYWtKN1RrL2dSdUJmK3l2OEY2MGdxc29GRGFzSEM3Smh5VkdwTVFuemUw?=
 =?utf-8?B?aFk0ajYvZmxtK05aZExYTU5XRVJKY0pyVDBPOC9odWR1WTU3bnl1TVdCVXBi?=
 =?utf-8?B?aHZiaFkxNUs2TlNNMk1QMXhxYWdjUVE3V3JYR3YxeGNSdG51M2FPbEIwSjhR?=
 =?utf-8?B?NUZmYktnT25xZzBIelBkMDYyTHV6NkUwZmVwSkpMNFFJY0swYTZKZEl1dlBs?=
 =?utf-8?B?dnptQTI0VVhMdXRoOWdZLzJZcWk4OFR1eCt3cFoyeVZLbWM5TzN5S0VZeFFu?=
 =?utf-8?B?VE9NQnVhZEpoZU5SQlNKN2tvTVczQXBpdTJZS0NHZHN6V3dRTHRGeVJ3VUFj?=
 =?utf-8?B?L3dRbm81Uzhrc2VkczNmcTJUVmxaY3NCVWdIUWZ4OFZxekt0d0w3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b35f34-a92c-4d10-2b5a-08df09d27e43
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:46:17.7127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T//7s9aJbfUMU1KGHq11mHVVbQYlX4vHKI/rx+w64Gpr9GK9i0Bow9oLhY9vjasSrnE725trpDbIEp7aNRqE/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7408

On Thu Sep 3, 2026 at 4:34 PM BST, Miguel Ojeda wrote:
> On Thu, Sep 3, 2026 at 5:21=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>>
>> Add a mechanism to perform const trait method calls, with the same type
>> inference capabilities. This would only work for concrete types (not ins=
ide
>> generic functions).
>>
>> As an example, convert `as_char_ptr_in_const_context`, so instead of
>>
>>     kernel::str::as_char_ptr_in_const_context(c_str)
>>
>> one may write
>>
>>     const_call!(c_str.as_char_ptr())
>>
>> instead.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Thanks for resending this!
>
> So I definitely like having `#[const_eval_only]`, because we do want
> to limit those calls sometimes and it is nice to have C++'s equivalent
> to `consteval` (perhaps this could be called just `#[consteval]` to
> match?); i.e. what we talked about in the call.
>
> On `Const` and `const_call!`, i.e. the other two patches: I am not
> sure if we care that much to introduce a macro for it, but it doesn't
> look bad either. I guess perhaps it helps to have a consistent way to
> do it and to easily remove it later when the actual feature lands in
> Rust. I would like to hear some thoughts on it from others.

I think it's good to have such macro compared to our current approach; it c=
an be
made into a identity macro once we have const trait impl.

FWIW, I even considered an extra macro that allow you to write

    #[const_trait_impl] // #[const_trait_impl(foreign)] for core types
    impl MyTrait for MyType {}

and generate the `impl Const` part too (and also add a line to the document=
ation
that the method is const-callable with `const_call!()`).

Best,
Gary

