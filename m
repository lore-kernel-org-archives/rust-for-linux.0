Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3F7FA373D
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 Oct 2022 00:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJYAtd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 24 Oct 2022 20:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiJYAsy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 24 Oct 2022 20:48:54 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2139.outbound.protection.outlook.com [40.107.10.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2810D6B82;
        Mon, 24 Oct 2022 16:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE9yPLhUcE7KijGYqA52HffhJkwv2YF/N57WeoXhY29mTmUDwDNthqB3f2el93eyznmVVNMYPXe8E8eq38vpfQ8Ib/+fMjGOfPbGlJc7QY6PvAGFJiscFdkxs+pw6AjDNDn4rjLQWBiKRUYEJSlzk39aKtcwapVZTC1XFEHeZXVvM2IozPo8BkBLzaP2MnvybNKBEk+XQHItBVxEmmm0FXbAexSlqbTiTV2YuTXRhdHFgJoGAWU9sB9kfd3Rq0QC2igs3z3zk46yvf111a10+Ai70esZLvV6CyuCo7uwzHnC6Gkq8m6T+jI/5jLnrNlC5iUOxbuwPIP3RK47To5PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Gvu34jrmS8dFzCWkRyo8iBrk0vs/zcGtn6g3gXKt5Y=;
 b=QFr0mDNsY73mLQRI7UV2KTgb8BAKRtKDxFhodWP9Nz3gTo9lLvag48MRY5jEocEKBb6r+sBhZ6BwblNS0U+J8ATzhhWfjBr1giOb1xyfIUQ0k7tTt5eZ2YZBVjifMzOxZ5T2pwWTPfrrgeMC9ENXJo+m7ogYZ5DNYDSG16SbMb+EswG81UTHUvky9iqgcpxghV6iyfhPpAfMK0+yu/C4PV00RseoiouIx0C/9/1ccj75lYmK3czZvx5STvZ8pupZGxrQFvyOvRPqfq4PW8rAxrNmVvRKrM2reRhb7/1MqGsV5iMCqVraB+EQ9sYCmRXuqSuZ7Hp93rjhRYNJpaaOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gvu34jrmS8dFzCWkRyo8iBrk0vs/zcGtn6g3gXKt5Y=;
 b=Sc2/NDHAIUQ9K3Ie9NXGsj9zGiva8nhzhMn/0NF3gEfRZ3dsko3pJyvkhlP8uRGyraTXupNENce8GAgzDoD6dSPVWGhDyFCNTsz9d0nAaVB6hjd5aVcA4BcIExFjsKxOavKQg1uvMxB2AK789Dkdgg+tBvgwK7zlBeSubxduuKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB2071.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 23:25:15 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304%6]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 23:25:15 +0000
Date:   Tue, 25 Oct 2022 00:25:13 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 2/5] docs/zh_CN: Add rust/quick-start Chinese
 translation
Message-ID: <20221025002513.49f1eb2d@GaryWorkstation>
In-Reply-To: <82a36881a46eb8afcc754f81f196982ac3f6c735.1666097959.git.siyanteng@loongson.cn>
References: <cover.1666097959.git.siyanteng@loongson.cn>
        <82a36881a46eb8afcc754f81f196982ac3f6c735.1666097959.git.siyanteng@loongson.cn>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0117.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::33) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB2071:EE_
X-MS-Office365-Filtering-Correlation-Id: 6954016c-9caa-45eb-3332-08dab61701b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cuc4/Vg1yZIblUovFDqoAuTA4UePX7Fvne4TshfNEZlgOIEzoRs6QFzrI4tvRDp1e1yBFCRddmsY7TQNPDKu7t6hNyVxSdd2EeZnAVQc8O+3EBwWrTF3K5wqlbFD1mMvyRSTi5ForY80iHxoQYiULBxBIJAiI8BmivnaHX0G6VjYxI4gktIvjyL9m4uNmWU3OFgKd2xQTa0HdX4y7NJlhiuMT+uA5g8VrfIdPO5UkHfnEtNzOtySnyh8alH7TgxQ747z/+D+3mwUfi+CtOF23qLVep60OCXHRsd0pkPLEAKO8UvpT1glB9ovy2dx5UL9F1yVV+b2wB4isfRAzUVWuInMS0cULNGRjIYIU+o2xIUb/LmeBncRzNGmKQsyJOhbPteanTt8i0cjRVii43J+Kr50iJDjVSp4pGew2G0OIFiWu823rkNOIyvYkiF5fA8dXd5y19+YMEZDDcHWO/GglyVS7NRsOddQM5meilJq1O5PdQI1g1h1w2rcjVIJYjajCJ1Q2CAQBzI7Iy6Lf3j1jFxvNtdXgNuwXSC8pbuOg9q8WEZpWiBbIcJ2xlz1rvwscSL6O+PErO2G1azopLElpYM5294GvPysurYLDqVHn7oQZzyzBiTSBccU20FXTbBgM3WTXIJD+3IoLx+BhPSxd3uks4XkfcHNYGUrhBIpWj+8AnBxOH6akMSqlrz50cqAsoPVGUAfoIA92upOykZn0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(39830400003)(366004)(136003)(396003)(346002)(451199015)(86362001)(38100700002)(66476007)(8936002)(5660300002)(4744005)(66946007)(66556008)(7416002)(8676002)(41300700001)(4326008)(2906002)(33716001)(6506007)(1076003)(6512007)(9686003)(6916009)(6486002)(316002)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MURrRmhFWnEyM2U2VjVBVjlpTCtSWm9KdnE5S3p4VHhyV3hQdlovWTBuSWNZ?=
 =?utf-8?B?aXV2WUFDWkJsdjM3aEM0WjV2SGZVdFFLWkVrSmdmaVpQM2J6TlpPREdYSXQw?=
 =?utf-8?B?Vk4rTXVOT1NEeUUrTWZUUEQ0UUt0SVV4amhIWHl6eGYyUXBxVVhGcm5INi9t?=
 =?utf-8?B?T1g2UGovSjV5Y01uSGk2b1J6cHN6aWJpUERwYTBEa24yWWdvUkR3TjhObzNQ?=
 =?utf-8?B?cmRrckVwQW80d01laWZSdG9FMEMzdWdaQUdwYnlCbnVwSENHOWRGb3RraWpM?=
 =?utf-8?B?U2JVcXpNbG0zd3JQSTNqb2VNeDhIQWtBRm53bHJLOHdiUnF3c1c0VFE5a3di?=
 =?utf-8?B?WklnNjZxN3lJS3pIYlBXM2hWVU1RVURHRmFwaitNVVFTRmo1b0hWMkk2QTN2?=
 =?utf-8?B?YzloRGpBK1BONTJRMUVwOGxETkRUMnNFMGhPdnc0UG5mN25xa0x0Y01rVTFh?=
 =?utf-8?B?VHNLUy9aUVhNeGVHWUtmVVp2TlBqM1l1SlBXNVV6QVQ1bVdhTy94bUZ0a1RH?=
 =?utf-8?B?NVJIYVdMaWF3UFFCRW85Uzhmay9HQlprN2ttTjUwaWUvbmpjUExyT2hMNG92?=
 =?utf-8?B?YWJmTm5WS3ZGRk0vRlRUQkdidmpENTdWRkUyUU94ejkyV2lNWUhCcGZhL28y?=
 =?utf-8?B?VWhRdFg3c3JqeFlFQ3pGUWh6VDJIeVdRVjNJeGkxU0FLY3lTSVA5TXlNSVBL?=
 =?utf-8?B?NEwzbEsxRjBuSG11SmYwMlNxMndoRzR1UnBtTU5BUEM5YWNVT2E0c2tXSTRj?=
 =?utf-8?B?cWsrUFNxcmFGd3pNYjJDU2oyMmNLSHc2Vk5yclB6alUxMEw4TjFyNit6TGwz?=
 =?utf-8?B?RWQyV0llQmgyeHFIUzk2bDdwN205bi81aXpjb0Q1dHU5aDJKUDFPMWdqMzlr?=
 =?utf-8?B?MjZ1WGNYUEhMeStTeHVsNlBta1pRaVh2cFh4Q3JVV1NPTXBYaW9jUGxSeXRD?=
 =?utf-8?B?SHhoTEc0cXdvSXpXN0ozaVdjMUpFVUpUY3pJTkFpK3J2TGFST2lVTS8yVjcv?=
 =?utf-8?B?Q3JOWkNncE14azQrMFp4cW5UWGU5eE1ka1ZaSnFueTQ2RHJSWlQ3TmNSRTZL?=
 =?utf-8?B?NnZJci82SERUdjY4VjVMVFpyQnFmSlRyS00xMWpRNWlWelA2ekx4L0RiTDRn?=
 =?utf-8?B?QWhsaHpaMFUrWWkvd2w0amVNQ1lEd2tZWUZ3U29IY3FUaEQyaHlpZkhQQWpZ?=
 =?utf-8?B?em94WjNuUUpqWi9RMVhGVnJLM05sRFpkT2QydGRueVo5Zkd5aWhIM04rTG84?=
 =?utf-8?B?S1MySkY0TE1adENmdlFSRWNtQ2hycGFJcm5CR2VJd29sQlc0NjNrWWFpQnZM?=
 =?utf-8?B?cmJpQWQzLy9QamQ0eWFvaytTT21aK1ZCYUY1dklVRERqWlo4YmVZbThuSXcr?=
 =?utf-8?B?OUZCNjRsQUpNZG1nNENuaFk2cTZFU3Y4dDRNanNXSjk0M0tGMGpPZTZWcHR4?=
 =?utf-8?B?MVBtb1J6cTNyc0pKYkQ1UWhoOE8raWN1ZHRJRDltSnE3MjY0d2ZtamxrcndG?=
 =?utf-8?B?OUJrdzJiRWx4d1NLMGx6NU94cUhoL2RxNmlQaWw1SnI2dWdWTGFzbWVienVF?=
 =?utf-8?B?QldSUDZJTnFuejBRWlZ1Q3dmRzRlTWN4SjQxdzlXSll6aW55bFJoWUlqbi9T?=
 =?utf-8?B?ZytxaDU0N1FBaWM1K0ZMQ3ltYWtZNGtwK2ZZbVlndVZDaTluM2s5UUNwVXFC?=
 =?utf-8?B?Y3R0MFJIWFo1a3c4UUh4WE9ybEtnNTl5dzBtWE9sWW52MSszMmVOaUxROUFa?=
 =?utf-8?B?bm9zSVFSVUR5SjlxWkFPNXk3RjhLVkE1M1dkT2oxdWN4c3Y0ODh6aVhqRmxX?=
 =?utf-8?B?N3BDSmxoNzcyUG5hTG1MSnJSeTBSL0E0WXlJQkpBYXRGdTA2WkJaN2pHTXNL?=
 =?utf-8?B?amxSNE54ZGRlRmZlNDQ3Zm0vM0ZwVGlyRG4xUDR2TWFmZ3Jkb2lZZFoxYU9U?=
 =?utf-8?B?dEdCZ29pbXVGSkx2WE5tc2sxeXk4ekh4NTJveWh6RUh1RThGYlozSGl6YkFC?=
 =?utf-8?B?VDhqdjJGNnZ1OEVtdTFzY2NBOGZFM0tES1RMNE0xOS9nem9QYWJYOVhMaFdU?=
 =?utf-8?B?ZW94RktjZ2lWY3dzd1NiZmZDSHUrdXVyM1ROTTlkb2VZT25xV3F2WDFOTjFI?=
 =?utf-8?B?b1FaL09sbGk2a3l5cGFYOEtMQ1lubVR1NzlDQ2MwSmVmZkJJbjNKRVk3MHlm?=
 =?utf-8?Q?xpfYDqm171ltuJjpP/8OseJzFKUewyUt27ql4ptzDZQc?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6954016c-9caa-45eb-3332-08dab61701b9
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 23:25:15.6545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FLbeigzXz4sxQ/LOgpwmG06LCTEZ0+U6GjNdp/k016ogqYvdZiMveXdM4YwM4N8ankklxRKO5aeUYUNrtFFJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2071
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 18 Oct 2022 21:04:22 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> +=E8=BF=99=E4=BC=9A=E8=A7=A6=E5=8F=91=E4=B8=8EKconfig=E7=94=A8=E6=9D=A5=
=E7=A1=AE=E5=AE=9A=E6=98=AF=E5=90=A6=E5=BA=94=E8=AF=A5=E5=90=AF=E7=94=A8 ``=
RUST_IS_AVAILABLE`` =E7=9B=B8=E5=90=8C=E7=9A=84=E9=80=BB=E8=BE=91=EF=BC=9B=
=E4=B8=8D=E8=BF=87=E5=AE=83=E4=B9=9F
> +=E4=BC=9A=E5=88=97=E5=87=BA=E6=9C=AA=E6=BB=A1=E8=B6=B3=E7=9A=84=E6=9D=A1=
=E4=BB=B6=E3=80=82

Would "=E4=B8=8D=E8=BF=87=EF=BC=8C=E5=A6=82=E6=9E=9CKconfig=E8=AE=A4=E4=B8=
=BA=E4=B8=8D=E8=AF=A5=E5=90=AF=E7=94=A8=EF=BC=8C=E5=AE=83=E4=BC=9A=E5=88=97=
=E5=87=BA=E6=9C=AA=E6=BB=A1=E8=B6=B3=E7=9A=84=E6=9D=A1=E4=BB=B6=E3=80=82" b=
e better?

> +=E6=8A=98=E8=85=BE
> +----
> +
> +=E8=A6=81=E6=83=B3=E6=B7=B1=E5=85=A5=E4=BA=86=E8=A7=A3=EF=BC=8C=E8=AF=B7=
=E7=9C=8B ``samples/rust/`` =E4=B8=8B=E7=9A=84=E6=A0=B7=E4=BE=8B=E6=BA=90=
=E4=BB=A3=E7=A0=81=E3=80=81 ``rust/`` =E4=B8=8B=E7=9A=84Rust=E6=94=AF=E6=8C=
=81=E4=BB=A3=E7=A0=81=E5=92=8C
> +``Kernel hacking`` =E4=B8=8B=E7=9A=84 ``Rust hacking`` =E8=8F=9C=E5=8D=
=95=E3=80=82
> +
> +=E5=A6=82=E6=9E=9C=E4=BD=BF=E7=94=A8=E7=9A=84=E6=98=AFGDB/Binutils=EF=BC=
=8C=E8=80=8CRust=E7=AC=A6=E5=8F=B7=E6=B2=A1=E6=9C=89=E8=A2=AB=E6=8B=86=E5=
=88=86=EF=BC=8C=E5=8E=9F=E5=9B=A0=E6=98=AF=E5=B7=A5=E5=85=B7=E9=93=BE=E8=BF=
=98=E4=B8=8D=E6=94=AF=E6=8C=81Rust=E7=9A=84=E6=96=B0v0=E6=8B=86=E5=88=86=E6=
=96=B9=E6=A1=88=E3=80=82
> +=E6=9C=89=E5=87=A0=E4=B8=AA=E5=8A=9E=E6=B3=95=E5=8F=AF=E4=BB=A5=E8=A7=A3=
=E5=86=B3=EF=BC=9A

I am not sure how to translate mangle/demangling in Chinese, but "=E6=8B=86=
=E5=88=86"
definitely sounds awkward.=20

> +
> +  - =E5=AE=89=E8=A3=85=E4=B8=80=E4=B8=AA=E8=BE=83=E6=96=B0=E7=9A=84=E7=
=89=88=E6=9C=AC=EF=BC=88GDB >=3D 10.2, Binutils >=3D 2.36=EF=BC=89=E3=80=82
> +
> +  - =E4=B8=80=E4=BA=9B=E7=89=88=E6=9C=AC=E7=9A=84GDB=EF=BC=88=E4=BE=8B=
=E5=A6=82vanilla GDB 10.1=EF=BC=89=E8=83=BD=E5=A4=9F=E4=BD=BF=E7=94=A8=E5=
=B5=8C=E5=85=A5=E5=9C=A8=E8=B0=83=E8=AF=95=E4=BF=A1=E6=81=AF(``CONFIG_DEBUG=
_INFO``)
> +    =E4=B8=AD=E7=9A=84=E9=A2=84=E5=85=88=E8=BF=98=E5=8E=9F=E5=87=BD=E6=
=95=B0=E7=9A=84=E5=90=8D=E5=AD=97=E3=80=82

Demangle has been translated to "=E8=BF=98=E5=8E=9F" here while it's "=E6=
=8B=86=E5=88=86" above,
which is inconsistent.

Best,
Gary

