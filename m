Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022106.outbound.protection.outlook.com [52.101.101.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137B45FFA4;
	Tue, 18 Aug 2026 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050842; cv=fail; b=Mgo5zupehm9RR5JmdRyRWTVCsV7CuOGcEyRs4w3+GOKpTfLUST5+lj0qA0dPzDr8vS8DB6sEAP9v82Uh7o0u+oJi4fjtAdUDGJDkDGFIq2+N8PmylpJM704TN4M77SttFZUvGjw3Q/utDGb2/GF8pU43NGGl0YILI9iqBoMyKQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050842; c=relaxed/simple;
	bh=p8oN1i7Oee3BUmqUaYkbPRcS6Y2i2ebI7bT3qGYIKRA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=E0HqYbYiIX4A6TsnTCuhFsftuRkOMkcXuh1BR7yDzr+unIkANEpDvbywm0MtvgKuHvOhc0lzz2Bd/J9dCU6ME+UUSW1jTF6b9ADlov0xSuUr1a0t20VaDswyLSLcy/ssWNtUolOc0kmhE0y9beP15vYdR4iNKVD7RMGQxLI/Mhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GV2mieUD; arc=fail smtp.client-ip=52.101.101.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GV2mieUD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rU7qMONDg1qXnC2Wm5bqGLxI1chkfcwzWCL9dE2eGpGgWBFUnjQprWBkHbugeaUNtOrBpyKEu2EjGw6akC1bkucyHBrJzNhlkkqP6LlA+BO7wkvJvqaUKcMcaAqDCTuQJB68ZSO1fRjoeiQuWc2vD4hXqFz1FXTN4JO+ojZrN8r1/x6eE1N9e6Quvxl63B5LBcoc0FwpeoIXa8iaDWdKh5E2Qgr00RzFig9o2IZg+JRxSchJI3oawOivzcws14uYuQJA6vh5LGhtvAviX1HEDCwgqg+FeVixKAv9JaWhLKnCDd2EmcN8KG0H9offB6fgL65redglCWC7MdKPkMT7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNI4AweJwhir48ZV6mXUOfeuMuU+ymNbDlhCmq231lA=;
 b=n7XQcr6WdH1crP+6pgWpoaSTrccQPXykqxj8YnkN1ZsL2PeM9h5L+vQXZQbAiXvk2WlxCp5AYk2BsPWvBdREH8mXkAXEMJ44EOKrlTOX2P9OzvtuW2tM5BeEPStLIf5gf4xGHBycxi8zEbfIXzK0l+MBq5ojVY6Yei94tSAerDydwB/Hl57CK3EVrJpK1Aa5jTbjoQCX6sh9zh1LaaCTk2x5mCDqsRCfASZqejxpMVjgkpKyOc9l4kSnY1TbrE1Ap2Gtzh7y9dt3XutXWzwmonIrkjNQPeVeDpuvmUVrQRxSJKDSwzdiG9ox+V9j8FjO0tW5+nzfGPEHuTshISXk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNI4AweJwhir48ZV6mXUOfeuMuU+ymNbDlhCmq231lA=;
 b=GV2mieUD04iw2Q64vtAjDc7OhTX2V4kRrP5+bsfak5mWClB6wiP437AHkzzvG/AwH6d3dHWg0F/d37xS+SajZO98zzUH3qquaX5WYv2ZZZHNM30BxymsRwhHdpaYRQ1jMR76wf/wduyCcq5KYDGl0n22EojWNiVMCGoMp6SebpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB3356.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:00:36 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 11:00:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 12:00:35 +0100
Message-Id: <DKS0NGIDGCIT.2N03Y8VZ7Q6B@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, <git@younes.io>, "Breno Leitao" <leitao@debian.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: configfs: skip unregister after failed
 registration
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io> <I9rMOFpWPbtlAmMsBCz7tH-ltTS1GDo5t-PVCCUa9X9MdkjjRkiRVlW1LO4wrbypD2fR3D80NozC8OdUxVBQ7A==@protonmail.internalid> <DKS0EN4DLKW3.IB8Z5VB3B7YG@garyguo.net> <87tsor8zty.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87tsor8zty.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB3356:EE_
X-MS-Office365-Filtering-Correlation-Id: 194abcb4-7520-491a-ff13-08defd17eeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10070799003|921020|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nuApLbwEk9GXKb7+HkJoXSnhtMe5Et0NjK1Ur29qi80F6B70QTW6ULbu1YH5qJba1+vbTOsfaoQkuUamdQV1pliuc87HyC5YiXjuuOO6BkigH1wJAIrV7XqSZjGptLsoVLy2n8NFyitqOMgMTp4lKJgVFpzFn05JX26s007E4Dtw5AiXbGpao1tAo3Y94TJ+h6/+sYIOllP/a3vVgYVmfm0yMdprWJNeg1WQo7xBgPRzzvJ4MTtAcJkDakVLPFezMGo8pGcQ4OcRFdYmU0pAlUY6l5g0H5vcnbAZdC/FCNob4zllU6OaOcGBuCdqFZgQC8FDUT3PWNAcYIKL4EsOYVqM7kAPpj4dyQH+XqUC69KZb6mAVw4jhELov71c+Z533Y9kNwvKblvfd2eG6r0zhWf6j4FU+0IKlUqx4Hiehv5hyonqlX4RKpHd2gUJ0A9yUkdaqQO1zGo7akbhXXQzYSFL7iaTq5HALv3Si71n51oYxcQDGqQOlCaY9z6HePvzTaO5dTFigyDMHqs/emlQxO5uDpBKrq52q9RxEikX9B/Rbiz3yjunUb77d25tte6qNxx0KhLLBiPRUhTTVk77U1u0VmRGkL0uQkmW/0bAzcvLXs/FbauJPOid4iyGWoR0UxE6Dd5rH9xBE1rJfnRlJPaep0RquldQE7IrTaUTTJXhuueouKSTowElVHhCdpKlAOA3UJU9WTA90YP5hfK7zA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10070799003)(921020)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW1vb05OUjJ2V3YyUU84czZ5MktEa1R6Z1htT2dBWmR3TUVWMkpESysxaC9k?=
 =?utf-8?B?R1dXTnNQL3liemRnZkcydDNIM2NPOHlCamJqQUlsVy8wbDFkZEZUaTlSdkpp?=
 =?utf-8?B?YzM3Qm82a2lFR0dYSFFqMGRKTzdyWGwrU3N2dmlqQjZuKzFzQ3RUUU94byt1?=
 =?utf-8?B?ZFBRR0JMUUg0Y2JvZ1dIbzQxYW82WHVtUWZSS1JCMTNLUngrT1JjMDU1dTgy?=
 =?utf-8?B?d3N3ODNvbFhQRzZRMUZweUptLzRQcXNVS3J5bGp2Rk9kaXIwZXhpRHhLalI3?=
 =?utf-8?B?WGVlaW5yL0F4M0s0QkpWRkxYejlkUnN3Q0xlOFBuMlk1ekJ3aVVpUnNzcmVk?=
 =?utf-8?B?ckFhT29pZk9ZbU15eXpNaUttaDdWVmlqeklub1U0dGhSMlVnNG4zTE1YU25D?=
 =?utf-8?B?N0NhT2laUHpuZ2ZoTmc0TFBlWGMxcS82R2d3TDNRdlV3TjduWjFDb1BtMlBl?=
 =?utf-8?B?RnloMXY3UUp0WlFIQmRtWVJQbGs1Q2ZlTjFoNzFmc2RObkozM2R5Q2ZYdzFS?=
 =?utf-8?B?eWdPendZU1Byb1VkNEdZeEltV0w1SzAyWG05NDZWRXFVcHpYU0o2TVFKSmI3?=
 =?utf-8?B?TXdrcXErSUFOZG81dEJ1SEhmZHBkdTZmODJDUG5WS1EvaDJ0RGFyemxUZmJC?=
 =?utf-8?B?aDFNM0RvTkhGOWpibkx3RlpRRU1oNlRkcmZnU2xLYTFqNkJIY1JEMUc4eUdq?=
 =?utf-8?B?SDdZcUg5UHBKdFBVbWJCRlFaTnZNNmFkbHJZdmdiei9VQVd1OE54Mnh5b2hF?=
 =?utf-8?B?elM3dEJkclVBdHZwTGZiZmpQNkpKZy9ZMGZiZCs2NlkrbWd6eTcwN0pRS0xX?=
 =?utf-8?B?U0lNeEE5U2M1RXAvUnVtcThING1GdncvaGJOWUROaXRMZ2hrM3liMUJYRGFT?=
 =?utf-8?B?a3pmemtkSEdGOU5EU2FaQVd3QzZuWWtNMHM3UzZqZHlnQkFITG9JT2FVRjdi?=
 =?utf-8?B?VklTbjUwVWh0YjhYRGU1dFlEaWpaKzFhWnp1dnRkcERpeEhETHNWdHp2WHFS?=
 =?utf-8?B?b0x2ZHF3UWl3R3dnVHJFTG1SQmxmdnRidDY0eDQxZlNwazBZYUhNdjdlLy9D?=
 =?utf-8?B?a0VDbU56ekdlOFVBSHBpQmRKdHBQRGRUZG5XU2owYlVpdFoyQTNzdm84RE1M?=
 =?utf-8?B?eEZzbkpOVm9INEowakRlUlVvYys5Wk1xMXlDbEZIWW9lMmVueG9rdFduUElJ?=
 =?utf-8?B?OVlLcnRHWDc4M2ErNTBSb0g5TFRNa0s2akp2MGJDQXdtRTQ5Qkk1Ynhkbzl1?=
 =?utf-8?B?Rm5TYkp5SUxERUZTY2szRy84UnF0Nk00TzlPYW9vc3VZWXpOeXI3L1lLTklv?=
 =?utf-8?B?dFo3QWZlelBOMm9ET1gzZ3ZGWTVwQXBiYUc0d2JZL0FCWmpUY3phaEZsSEVW?=
 =?utf-8?B?UFAyaFNBZjhVMFlNNnpsTDhxbXFqZncxUEcwVlNIcDlHczRFWG43SHdLT3c2?=
 =?utf-8?B?VnhVaXFCRTVuYU9BNytQWjNIZEg1L2p2U3BjQi9kZXFnUmlNZ3RrRG9jSy9H?=
 =?utf-8?B?UndxS3U1eVZLaTVGVXAwemtjczBVQjVIUllteUQwbWRaQjlDMTNvL0N6aktU?=
 =?utf-8?B?VkZ3VHJTR3VuWHhtVXpBZVF6UWV6Y3N6NVQxeUtRZzYraStKR1VwS1FrcFl2?=
 =?utf-8?B?bGpNNkRpYkdha0hmVHNGcTZBMFh3b3VJc2dGL3dibWtyLzRMUi9tNVhQSjQ2?=
 =?utf-8?B?cVV0WXkrUHArM0tOalFxWEhrSzBJUm5EWEgrNjN3VGJ2YVVVdWxjazBSSXNl?=
 =?utf-8?B?USt0VUdLcHE3M2dqQTJKa0drdVIxd1hKcyt4dzN6K05EaWErNDNIbFFCNFkv?=
 =?utf-8?B?ZXEvcktocUZDMG5mV2MwWktaT0VETEJjajJTNDBNS0pIRDIvamp5U0ltNzB4?=
 =?utf-8?B?VThrWFFqRFpTWmpZM2RCQkNZVlJpczgydFlDNVlVS0JUTlJKcnNQaGlCdkZY?=
 =?utf-8?B?SWFtdVZDN0NCUitoWWlCaWtGSjhkMUlaeTh6YXFMRmd4d0diVFVIaE9QZDFK?=
 =?utf-8?B?RllKeUs4d3hBa1k1a3I3VnNGV0MyZ2REbnRUbjQ5L1dMMmJ3RWlqYWlKNmNY?=
 =?utf-8?B?VklUYk9kVy9sekEzU0l4cmJMN3V5Yzh1MkhKY2dkU3hRUEk0TkkzaUt3amJx?=
 =?utf-8?B?RzM0OERnYTBCM2FsTDlPTXhhbVVNNUIwWG9kRGZ5L2hIdzdNNnE5TUsyNjRX?=
 =?utf-8?B?b3hwOVM1TzFRNU1QOGVpL3VSVjhjNXpVZzdrcGh3b2pXdDZ6WFAxSXZQaE1L?=
 =?utf-8?B?UFJLcWl6bGtwWVdtQ0UrSVVTNVYydkYzd1VuWktPN0RHdkdPaHFCVjRmT0lQ?=
 =?utf-8?B?RmhPOGhjTzFZU2F0YjVRV09NalBKTlM2Z2tLU1NoZXlYQWhScEx6UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 194abcb4-7520-491a-ff13-08defd17eeb7
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:00:36.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+2YaqhG1RY/21NRoYagswQa08Gcz6m2Rk03gzL7cq7/nTb9SM9mk0Z+tobI7OBY+AjO2c2QuVJNiwSEN8yJeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3356

On Tue Aug 18, 2026 at 11:53 AM BST, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Tue Aug 18, 2026 at 9:11 AM BST, Younes Akhouayri via B4 Relay wrote:
>>> From: Younes Akhouayri <git@younes.io>
>>>
>>> Subsystem::new() calls configfs_register_subsystem() from a fallible
>>> pin_chain callback. If registration fails, ChainPinInit drops the
>>> already initialized Subsystem. Its PinnedDrop currently calls
>>> configfs_unregister_subsystem() unconditionally.
>>>
>>> configfs_unregister_subsystem() requires registration to have completed
>>> and immediately dereferences the subsystem dentry. Registering a
>>> duplicate subsystem name returns -EEXIST before installing that dentry,
>>> so the cleanup path dereferences NULL and panics the kernel.
>>>
>>> Track successful registration explicitly and only unregister in that
>>> state. Keep mutex destruction unconditional because it is initialized
>>> before registration.
>>>
>>> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for config=
fs")
>>> Signed-off-by: Younes Akhouayri <git@younes.io>
>>> ---
>>>  rust/kernel/configfs.rs | 14 ++++++++++----
>>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
>>> index cd082b83e9e7..f358e227ce09 100644
>>> --- a/rust/kernel/configfs.rs
>>> +++ b/rust/kernel/configfs.rs
>>> @@ -130,6 +130,7 @@ pub struct Subsystem<Data> {
>>>      subsystem: Opaque<bindings::configfs_subsystem>,
>>>      #[pin]
>>>      data: Data,
>>> +    registered: bool,
>>
>> No flag just for destruction. Please change new logic to avoid needing t=
his.
>
> I guess we can have a local `UnregisteredSubsystem` that we can
> cast to a `Subsystem` once registration succeeds. Is that what you have
> in mind?

You can use the arbitrary code block feature of pin-init to run code before
arming the destructor:

    _: {
        let result =3D crate::error::to_result(
            unsafe { bindings::configfs_register_subsystem(subsystem.get())=
 }
        );
        if let Err(err) =3D result {
            unsafe { bindings::mutex_destroy(&raw mut (*subsystem.get()).su=
_mutex) };
        }
        result?
    }

That said, why is the configfs not initializer the mutex, but rather users =
do?

Best,
Gary

