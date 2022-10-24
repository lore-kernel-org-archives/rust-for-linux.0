Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82032FA3742
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 Oct 2022 00:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiJYAte (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 24 Oct 2022 20:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiJYAtL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 24 Oct 2022 20:49:11 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2103.outbound.protection.outlook.com [40.107.10.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDAEBE52B;
        Mon, 24 Oct 2022 16:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHgj4D03qHlJ70JKc2EovpC9XNP2IgkPt37efLMP5jD/K+G1FrdY43ah/Fa+/nSDSxHjQloY/rljUV6/ePdljrl8oa/4H9TpFp9ELbLis6ScCdbqgFB6be6ZC18dPKL2MpSd0uBXLA0+lSLFv7jNUWrTaliVCkF+yCH1azbCYZpB5NLhfHInnudoEhhB2eJ5pfl5vF+d9JaTs8e0FJ7NbQxNSG2Y4Qg2zPsaFbDGAOPUJVgDCYUwfi+wXP7w2Rl4xuiO3x4CV7x6kkhnFnPtDiyVmuTQhyf7oLu/yWGiKF4C5YVsEJv12k5Q0PMf2Pz8rn9GvwvLCzP5sgDtKt3pmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUoL1mlx/zTWWrSBREjZuGmDrFMahrM1egiATwgR5pU=;
 b=HPYcuQWg48IFrZ80xWrMJWF6E6+bVuuOwJgwrz9QFu/Hciplh//bbS8hGVOeXwif6QYMwpvAvBYaB/6Gs8izFrGNrXxKzV2hoQkYGA6a9Huu9SnEofrYbiUjBlJXWplIym3KxUw8eAbX9Ob5yfXKbqVsnah7mzURrAizKocakF7zCu+9m5DNiUOdCr0FJOHLSzM+4MW+CcUtCGpr3eZRC780YKrD8+twGcoB4SoDNBRQxsrAXFD+7rJP8km5q3cAVSredYW4Xe0xhd2LCkQdjJF6bUlIM+SBwQOaaYMk9UaeZivphlRAzQtMwNyDKYf5I7mPxGAHYfvdiTfNwXJi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUoL1mlx/zTWWrSBREjZuGmDrFMahrM1egiATwgR5pU=;
 b=AfxzsaDThwCUBGMDyg7cEz5atpamQvM00XSeVeZqZXGddKS2RuY+++Mz6cSTN5UMp3IolpGeWXOvq5YWxfg4koTgLiV1qAX1hdb4x+LjB5Y58JZuCWpJR5pIu3gCkXm3PJmMsar0o4xoDEZ8Hvcnnv4lAchXfmAc1Hx7dv+b5KI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB2071.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 23:26:56 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cf2b:281:50ee:3304%6]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 23:26:56 +0000
Date:   Tue, 25 Oct 2022 00:26:53 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 3/5] docs/zh_CN: Add rust/general-information Chinese
 translation
Message-ID: <20221025002653.16425aae@GaryWorkstation>
In-Reply-To: <59496aa23862c41051836de1121a2fcf2a5f1bc5.1666097959.git.siyanteng@loongson.cn>
References: <cover.1666097959.git.siyanteng@loongson.cn>
        <59496aa23862c41051836de1121a2fcf2a5f1bc5.1666097959.git.siyanteng@loongson.cn>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::12) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB2071:EE_
X-MS-Office365-Filtering-Correlation-Id: 139feb2a-ab4e-4b58-de4d-08dab6173dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLZ8dJBYvLRJga1UkTd+w8bPO3diEBTYaOyEcpYUcTF/kLey+7PMQk4fCd9VDcrpbSDhGYLwvUQyqPl8t3zP3VkhehZnq0jlkB6xGa8ViNgikgt8nWlIVZpwJzP1hQrB0Mx2BL6Eit9YMGiXKIuu+SYq1YgfAmCsPt27CVpf2DwLY73GkIVspsYQLPgkSfSrZgLe/vzcMvX+g9jdoIoKMEmoGqFElu/mrBQ1G87/mblBn7vgjV9xeyHxY8vyEbWItsx63r0EMPIc4wqtuovIuz+WPXLe33IgCjKvNshlq/jp54IC+5AK9//KaNKGti4nww8zzk3hDedxBCFzNkoKsbedJ+lk1Pip6l9S6vt8nm8zBCOkp3InTXd2DxBcJOh85shQmURh0pi2Y8YlpnyA/UvrvrQCOFPQ42EwrWw/sHryIpBwjNKD7RqPzMLgYvGm8mvVMq+2lwdrllH1j5HxgklQSEAWwhrDDMpR7UhK9dH9mgY60cFhAGgxGVKQuaS03lsE7S7jAN/y6EL+gnSubqqeWrAU+E8/2YIMluhBInO6EMOBBAuTtn1/OzhoPXr2BKSB0eECcUvRLjXfzWkNt9yNIV77Lel9aNQC6P+gz9t4T0rO+zEYzy7K3+kwhslX3VhQOQ89/oNkR7bF2FHyAGvWMIG3rQN2bZr79zswJ9buwQg72u6jFUJYqKl+JKgYwQVS2RqbCEz8HtTzEiJWyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(396003)(136003)(39830400003)(376002)(366004)(451199015)(66476007)(38100700002)(4744005)(5660300002)(7416002)(66556008)(66946007)(8936002)(83380400001)(86362001)(6916009)(6486002)(9686003)(6512007)(1076003)(186003)(316002)(478600001)(33716001)(2906002)(41300700001)(8676002)(4326008)(6506007)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ps2X0ToEoXWA4agvS7Zk6IZwaOgOiIk/2hzDr/8fTJaLdr2C5f57OlwXZ2Hy?=
 =?us-ascii?Q?fAmPLKjPD0hcLWbY0gCxBpUl5A5jhSGaV78gYy69U6blWPihETs+EPi1ZmoO?=
 =?us-ascii?Q?mPRwn8G1zdcX+YNclCDhELzkRftgksbflsa5/2VmLhjVaGDwZHQPo2TeZAKc?=
 =?us-ascii?Q?UKdS5lS0jPppofLFbDqtLxY0V1TSV8r39Q43sKrNpYoal7Pmox1qsBxmDBnP?=
 =?us-ascii?Q?1aBx9NCIVgvPP+GT9H8VewyB3HfexeS1si3Ku7Ac59pZDS8gqpBMrHOIp/qt?=
 =?us-ascii?Q?X0ZaWBiFPC5hoX/CunyQpxpFOXFsc5Y0tNKer5k2a98v/asO2SBmZiCaMBmc?=
 =?us-ascii?Q?sG2oZ9dNPTwTw4hRmG6iSxqgwO+FmpwO9DTD0Q5wHJGV83+Wu8iOH9G2I0Mg?=
 =?us-ascii?Q?P+qgxc1v8A51XMDkBMnsAoYtZZwsSf7kd/AUNnUJY3qtbzhGUpLosdqTRAqQ?=
 =?us-ascii?Q?R2lqnAF72u2T0/NzF5Gib/otJwrC/L7ylOT//WhX9zhZ/9T//haboW1IFZUG?=
 =?us-ascii?Q?PYfereM4s1aHJGJqOJo3nizjvUhBFedsDdfxzHZRr0Gse0Bs+6is186YFSc+?=
 =?us-ascii?Q?RlnupVsSPGi4g1dXenYnYYvUALN8/sYfkeYa5bi3hbQZCElOmqcn2Ll0k8V/?=
 =?us-ascii?Q?1R+Bo0XJmaRU+ZhHc9eIDoyhXjiiGMPa/lYe7Y4kvnonhwrwRC3/nYQKcruy?=
 =?us-ascii?Q?TrgVhvCh/dC+QExR+mws1JGGbKZrkl18JdMoZZ9uM7hZtoFQjoBy0qRNM5Xa?=
 =?us-ascii?Q?eXxlmlmE0ODHyG97vAERaBNaPs6dj106eJlz4sXUIBBuejsybFuZYbVplShL?=
 =?us-ascii?Q?ZuXR+WCMpOw2KND7mnh2RNjI7ilgh4QDWxi2gT5qbFLP+pV31fo+n9V8n5qn?=
 =?us-ascii?Q?J57lD+pqus26LNP4oReD5kv5PiB3WPoqU1fAEbjvEeZIhkVDm6cO8ELUiQ83?=
 =?us-ascii?Q?snU46D2brwd1encdX8lirBHzY8ubCA5lt6rrAvndjIEShzt86prX377vnPWG?=
 =?us-ascii?Q?DROng7YLpQAQcg/3JvgC3CQnu9x9rovv3N9fjie6/oFMQjD4ybQ/0el+Isty?=
 =?us-ascii?Q?vbVKBt+C1lncMDKrr7QYdjxWuebRzC8k+CHZII7/WnHix4PI7y4pzxejFwLI?=
 =?us-ascii?Q?mPv8WsBHhSm9WqhfHp4FqS2E1/KAmdre07elIHfxLfm+ISC7MqdDjWr9fjcP?=
 =?us-ascii?Q?VKk+sQsFOJp8Gft/A8X6PO2UC3TIUpR7gfcsF+uOWYcyFwfvRDmQL/R0hXOe?=
 =?us-ascii?Q?aJ/5QMjU7N0G4yPuuNsRjdZXnXWwL9OIfbkSRzvBHyPDF4ElBvmypI11Rpll?=
 =?us-ascii?Q?AME57fruW04UozXGl+0BzzUI284JaflC6Fcn3SSBa3dI935bMs3KGSTTXEjb?=
 =?us-ascii?Q?VHIngTodNAqIfUqQ0ZeEq/9bNa1EyUgF8DXHLSyBbfdxZGhkLVzHVVUVl9L2?=
 =?us-ascii?Q?23xSkpElTW22w41W7Q8AiRBRWRUiL01UcL7MqV7C+S+gMR6hqlCJhrP+F9m+?=
 =?us-ascii?Q?t9xuygtC50a9qCWwsoiJcd/LynpbumGRAtNm/I5nHEO1spEEYa0a20tzMSX7?=
 =?us-ascii?Q?b+nhF26WHGA71fe3wY9LMqiA0KWsXAjsStKeOTX76W6I18LCUbbGG93HzUTb?=
 =?us-ascii?Q?SzLOiqL8+dd5x7I6ol9D7beK9K5PqXKehOGEFblbk8yq?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 139feb2a-ab4e-4b58-de4d-08dab6173dc4
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 23:26:56.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrLF7cYfPsI+VtzuPDrLu+qBev5iPuNV2ZAhAL/fF1euTa4OSr5A39yj99/NR047W2SYcryb0LfXYi3IcTdxyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2071
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 18 Oct 2022 21:04:23 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> Translate .../rust/general-information.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  .../zh_CN/rust/general-information.rst        | 75 +++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |  2 +-
>  2 files changed, 76 insertions(+), 1 deletion(-)
