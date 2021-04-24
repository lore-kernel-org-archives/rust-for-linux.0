Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD358C433B4
	for <rust-for-linux@archiver.kernel.org>; Sat, 24 Apr 2021 16:54:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8061E611AC
	for <rust-for-linux@archiver.kernel.org>; Sat, 24 Apr 2021 16:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhDXQzD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 24 Apr 2021 12:55:03 -0400
Received: from mail-eopbgr110091.outbound.protection.outlook.com ([40.107.11.91]:36677
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230010AbhDXQzC (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 24 Apr 2021 12:55:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWlZm/phZMuzMHdnIwN8OYdAPtMQwgULCaNRdp/nJmBRl6/cR0Bkc1NvFGVBS3cGU6P+x3GEVgZMWiEmqRMfrdUXFjQuwKS0CdXmFFtxs1Y6KYNNKAQ9KxDzmIduqtQpBbqAjRNBmW4Za/kHzhyA/8nEPJ2Jm+uosCnJ1KPOkdaX4apH1u9z9AmGxui0TIgrIu9U/NST5Hyji0saTZtwr68OT9ru00vPd6Z/dExbD5bczh3i4y5BbF/dxaHhjfNLSxJLFfQ6nH7QNij2Qw+ia3Rb1HxFolJ67/yGheFdweo0J2OLOUiNkIC4s6jftkrYKsisgMp6k5+3t3NJR52rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmLYomeXuWKZnt+F/M+AYqyzsfv44VKMnwVvcLcUoOo=;
 b=L7kM2r2PdHrgJ3Rm+x7UH0a3SyNMUMPhYoSXYcQ/xQgRZIsEHttXlsQEiJeKOBYq1b6b/F6JxEwqLP5KncAKHJUwedMwBM4dxQqR0dzGMKjQQglCoGJyp4PwJpiZTRswoVnwfCopHqYvvLg0kZwBa4mRyQ/sYj0yX20R4uF4WjjEQleIG8ZoOsK0dxG2IJ7qiSuwIlksJbt8jEna80J3cHsKjm1k+oSIuH5r+WoGvw2/fJGLL+M7R7dac/AvudkAupzLgiw+STY+JPy8vDc3wGX7Se8y/taOdJt7/sesqhNKVvXmKvxobPqUTpjk4dFEiT2Nkoqz91qZgxlNABtoyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmLYomeXuWKZnt+F/M+AYqyzsfv44VKMnwVvcLcUoOo=;
 b=x3tmLsSzvXK+dBmITNhXDzd8BBo5IWAWC+e7oslAbze3pJV2FNVCxy4A+jKpsrVqQg7QjHTSjjmrmlDryc7Fp7g+my/CKhjVnsR7wfunrQGukSo1LyGQbLiSRJbBtHOof0mO8YTBbfm/5IYdlepw6BKdqGxT0R0xBFqQnOuwAPI=
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16::23)
 by LO2P265MB3328.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Sat, 24 Apr
 2021 16:54:22 +0000
Received: from LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7c1d:967c:3b08:1bd7]) by LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
 ([fe80::7c1d:967c:3b08:1bd7%7]) with mapi id 15.20.4065.025; Sat, 24 Apr 2021
 16:54:22 +0000
From:   Gary Guo <gary@garyguo.net>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: RE: Poll for call
Thread-Topic: Poll for call
Thread-Index: AQHXOG7W/LnxDF1XpU6SS+mH1G8buKrD43Fw
Date:   Sat, 24 Apr 2021 16:54:22 +0000
Message-ID: <LNXP265MB074661E8B90DF07701620D23D6449@LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM>
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
 <CANiq72mm+QBivEuwJ8=6ruiK3=kcTvLJ87gBrwJA6T471vLj7w@mail.gmail.com>
In-Reply-To: <CANiq72mm+QBivEuwJ8=6ruiK3=kcTvLJ87gBrwJA6T471vLj7w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=garyguo.net;
x-originating-ip: [2001:470:6972:501:463:fb23:ad30:53b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e82e993a-9bad-43cc-8110-08d907419c73
x-ms-traffictypediagnostic: LO2P265MB3328:
x-microsoft-antispam-prvs: <LO2P265MB332818210CA58D8BB509A585D6449@LO2P265MB3328.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k6nbE6kWZd2f8I2nyb8H1c5tZ3YibAgrF0x3eivKWgY3mmYTvQUM8rSPoeU/ay7Z7O/8z7jCjjQf7ZTypIfyuA96p0zKuH0w7LkNYuv1jLTTDk5V7UEFgUs98vrCHB1Vuw1o2Rx9RYLwIzGycJYYq9a3uBl/dH+FUYXK38FmLYpFAM3PzG7Mqd46FRja/eDOPUjkyGX7SOHhDRvVptHqYUMtHmqQD/i4y/rKXPJH/lKTl6iGF+f1WZCLdSIDS5BNyvT11O2OhH/LDZkyprxQAJsWHbBRFjWC+FmP+rlOqfEk4mBPuqCEsBI4VO7mKwo2NHGmNR8i9rxJOiTJHtORSww+EBbcz4sFZmxhTg+DFscgvlgZM3y0zXlUkBHwRmwzgyAnSohnUsu0Zzjz4u4oyYta1z4oLmN5Qup5H09lWAivJ1j1RWbrVhF0jlGxfhzQj9HBRF2unpefIVH7b3zG0pMaK0Gp77QmV2kITanavz3jD5p4xDSKn+HUjW/lp7Hgzk+sAsp28KkL4gFmuYpShQB6VyJfbvEGquiWPaURid3GLkg8f7DyIzjvYS2zIbAM0yGRK6MR9cYCESHI1wzxDDX7/rHKFWGg0/g5yLUbGns=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(376002)(39830400003)(396003)(66446008)(66476007)(52536014)(5660300002)(6506007)(71200400001)(186003)(38100700002)(2906002)(3480700007)(122000001)(8676002)(66946007)(64756008)(9686003)(55016002)(66556008)(110136005)(7116003)(558084003)(478600001)(8936002)(76116006)(86362001)(316002)(7696005)(53546011)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cG40eEtENWJRYlN5MmFrcm1OSkcyNDJRbEtLVFFEa3lhMzlQRXducGQ1NC81?=
 =?utf-8?B?WURGK3ViZ1FJV21QL2JHdDM3a2E3cGhub3RtQWdzRFllQ3dHM0w3b2hla0x6?=
 =?utf-8?B?cHBZeGNzb1FySkhCNG95dW83Ui8zdHNTK2RSZmlaL3pESklScmZKYTNhQUdM?=
 =?utf-8?B?amxJWTRaQmlOUWlQeUJWajg4MkVEWWZNNnptcmlCcTJwZlZQNnBRMkJPYjQr?=
 =?utf-8?B?c2c1eTBQQTR4UEszUDVOSnZWQnROSEoxazdHbmFWR3o0enIzcUJVd0xOU0ZI?=
 =?utf-8?B?S0pIRzR2SG1JVTVoajdTM2lMNFBOTDVKbk9uOGVjZVVpdGVYNll0Yjd0WHhj?=
 =?utf-8?B?aWFsb1pCMjdqZk5QdWFIRDJQbkt3dE5PSzV6N1NheXBDeVEweVJPU1dPRllL?=
 =?utf-8?B?YU5uSTNRbm0zaFhkUWNoamtodXhCYk4wV3d0bEJjU3k3RVZMSGlETTV4ZnJp?=
 =?utf-8?B?VGg3SzBsU2JwK3hRTXhsNFlVYXUzRSs5OERBNFdkRE5LQTNiUzZtSkJOVnFJ?=
 =?utf-8?B?cmx4endibkNiVythTlRIeDVzZGVYUEl0N0ZvU0hhaU9WcTFkbERrZkdBRGY5?=
 =?utf-8?B?NER4d2xPVjdhd2x5WHI2UFNPS0d4Uk1pTXBkMXVSVUhZdnlHVm9VbXJnYUZY?=
 =?utf-8?B?U1hjUXNIVHZ1NEVEV0c5aitrK1NNNSsxY1ZSSVJuUlZGTWd1M3JoZmd3cm55?=
 =?utf-8?B?SnQzMWIyK0hrQkVIbnJ4RmpRcXB0NVB1TWxRSkJXRDlOcWlQMnFueEdvbzlU?=
 =?utf-8?B?MFFSUXRJbGVpWS9NY0Y0RjYrbnBsQXlqdDdFbVQrcldPVUUrTnlvZVJlY0ZK?=
 =?utf-8?B?RHlSUjdkb2RJWlRFZWZ5cDF6QnI3R3dGeHJEc3UzMzdjVnA0QmhKc2ViT05j?=
 =?utf-8?B?ekp4WnRueGpySml4R2hjU3F1QVgwczBUMDdUTUl4d2tUa1VraG56UnBOdnF3?=
 =?utf-8?B?SWF0NnE0RytXUklCZXFlOEFpd1VxeG1YNmh3SUtKUHJmWWNtc3F2NFlpL0x3?=
 =?utf-8?B?VGc4RDRtQmJFeStGREgxVEJlZ1ZEQUYrVEpkZkFUMEgzald0OTAxRkhPRHRV?=
 =?utf-8?B?b21NbmdoZDBjd3huNFFrVnhvakNBampLeVN5OURlU1ZPTHZKRnd3SXpzVUJY?=
 =?utf-8?B?bDdBNWJEcDdBbWJjcGlPV214a3c5YXdNeDcxckpiTXI5cWhEcjVTSU5vV1pQ?=
 =?utf-8?B?UWU5QitpNTVKazZoKzNIN0hFejJoTHdGTWpIa01CcnFCa3NwR3lWMUNoWVd6?=
 =?utf-8?B?YThUUkJWODBrcEdRZGZRanN2OHdwMDJBOTBCZDhVYjJZL0dSRDFMNGRLRHNo?=
 =?utf-8?B?YXRCaG5uNXdSTGxsclpQQU54dFZGMlJKSW45Q0hjMDRiRWJWb0tVR1NCaWt2?=
 =?utf-8?B?eGJTOFNaMEJBeXpJMkRpbXpYYWhSL1BDNEg3dkVqdjdNTzkzS1p1eE14NElp?=
 =?utf-8?B?dnkxN1M3cCtUaUh4UVZqbGY1NnU0Y1AySUxnaUltV29mSDBjUkV5TDdpZVRv?=
 =?utf-8?B?ZDRMZlUrQTJDZ0NrWjQ3cHBIZ1duN1ZHMys3U1M1OW82Uit1QmNDK0lZUlZv?=
 =?utf-8?B?R3luOU5sdzJ3azNRUGlQdlhOL3VzTGc4aFNGM08waXdndk1uVGk5ZjhZMXZs?=
 =?utf-8?B?d3J0UHRPbFBLZHFOckxackJpQnhnSnlJTDR5UnhNcUVZUFYzMmZlOUVqWkNI?=
 =?utf-8?B?MjUwdFI1cTVLMTErVVBrTVd2NDhGSVFrY2xxbFFwV0hzUXJ1WWlNbCsrdmhH?=
 =?utf-8?B?dTlWMDkzM1ppY2tjaStQaURRN0cwckVoNXh5YjVRR1NmTGZYcGFiek1NUCta?=
 =?utf-8?Q?IutA5pLIY1T3PZg+HefTF/aIzinstpbZ5uYww=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB0746.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e82e993a-9bad-43cc-8110-08d907419c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2021 16:54:22.7970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UgviMU5ncbOv2qeTNbnvnWzQxPjm9WQPb4mVHWOGk/Po1NzGXLzNT20ZBIhD5V4FuGAa7cujTz6y7GgMmSpxmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3328
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

T24gRnJpLCBBcHJpbCAyMywgMjAyMSA3OjMxIFBNIE1pZ3VlbCBPamVkYQ0KPG1pZ3VlbC5vamVk
YS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gTGV0J3MgZG8gaXQgdG9tb3Jyb3cg
U2F0dXJkYXkgMjR0aCAxODowMCBVVEMgdGhlbi4NCg0KSSdkIGxpa2UgdG8gam9pbiBwbGVhc2Uu
DQoNClRoYW5rcywNCkdhcnJ5DQo=
