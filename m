Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9F7C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Apr 2022 15:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239993AbiDIQAX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 9 Apr 2022 12:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiDIQAX (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 9 Apr 2022 12:00:23 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2047.outbound.protection.outlook.com [40.92.99.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193131F6BF3
        for <rust-for-linux@vger.kernel.org>; Sat,  9 Apr 2022 08:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmPSViQIzKR6SrBG7uNj/YqmR+MJ9ogHrir0rx8/Kzz0ADCVLDxMw7bdN407DDcoM8zoY665rejI8yHmXivQcldDmRzn2vT87Lehq2efEwxdYsG4anpf3LZcwd8a8fww6hUhTYE+ePOYnz5APczsHM9Xk/E2rZNmz7oZGAmM9NBI7YJp4zMWYaRoF3VCDtUnZnNWrdXbmG7mifJpElCWtPXrS4qRxjOzF6HyBULiw1HrLqUrrjBv/jgJvFeqng6JdK6honZd+A9uvVlfX7MVRhN0/rLxcmKSp49FZ7RolF5rCHG4oMiul8eXoCG5JnvNA+53j/vDpbJWoXfDWYi0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Z3PdiaehFZoW/p3gtF6lYYi7Kuu9fofgOKIcK56PRk=;
 b=P7GPAUZWSu+COIeFmFGECwyEaJOa1pOU1dlILE7h/f/3dRknq7B+bqlPW2m83aTGNnAlxs1s1nc5LoP64lpePc6zRyfo8DvQaX+IGy0BypLG1pvw9W4B3/Jb+gDi7ArxpycLKz7EndbTU4pPznsLRuUl5UPuRwFS3QpY1wyk5RfPvpo8NXlb3n6mThaVssUMe909j4u08gFgAjnVyg0g7FyrHKrzCadG9JGHYE3+24OgEn2aZ+MIGHZVgg8JM8iWxdYWcRMWw9gUVe+pZ02euSF/x7FP9dv8n0L+0Nu4jHuY79/7PMqLhI09+tGKGyHWpbVbow8cgHbWKMMboK2Agw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z3PdiaehFZoW/p3gtF6lYYi7Kuu9fofgOKIcK56PRk=;
 b=Txe8xDbHE0q61E64SEd6jN7fI2lEcpMziOZEnWMeDOSE/o3KCRThEraStXwstJEe9M+g1tpiwu32E4bh+I1ciXswuTOoesuphpYj/vFbUIFURcSFlJ71dBPCa+dXndibMnX/zxF/BRQ8U4EvDQwqDlfjJZJaPAlWwnKcttm5ZHeEh11vHOJrSjrFny8rzHfTjnu09XrjKQThcioNG7SId4Z73SfGKw42pGAhur5OCxT4eMc5Uc5uL0US3mtpR9Yy8B3YHtaILz/3gRSihW6mYUNi7gMt9uc6IZn2nMZh8OXW9Rr2chZhjEDOo4b3ph7FO0YgqQLH81l+hHM2bO5dgw==
Received: from OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:189::6)
 by TYCP286MB0575.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:4c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Sat, 9 Apr
 2022 15:58:14 +0000
Received: from OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d5c3:652f:583f:fca8]) by OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
 ([fe80::d5c3:652f:583f:fca8%3]) with mapi id 15.20.5144.028; Sat, 9 Apr 2022
 15:58:14 +0000
From:   Howard Lau <howardlau1999@hotmail.com>
Subject: Does Rust for Linux support kernel socket programming now?
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain
Date:   Sat, 9 Apr 2022 15:58:10 +0000
X-TMN:  [Sy9MA4bnudBuk5Y7L8Qv/RKi+PNNl3XJq0Gcd8FHnzQ=]
X-ClientProxiedBy: HK2PR02CA0208.apcprd02.prod.outlook.com
 (2603:1096:201:20::20) To OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:189::6)
Message-ID: <OSZP286MB21285514FAC4E0FFBAEA6CA0B8E89@OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 703fce17-df2b-4608-7818-08da1a41bf54
X-MS-TrafficTypeDiagnostic: TYCP286MB0575:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FsgQXYWm4XZyu6YHevSn1mFvvIptDt6kqHeEujVqZS1XG3mwaK1o4BKl/1QD5fLJSieo2ewcYieJIGOo7cx0Zonc/oc4+qDxUzt4c2xwBY8s4I9cZjWbpRz3EkawQtOorci5H7UT74XKTW31Nt2su17GlKZIxeTO+NTgaQogX1qE5/q0crGA/XS9H594NM/eNljPk+ncbRWzqrNyODuGb/odt7x63PQ7GXSdfGxDvsLc//lEuA1oO600Gqq8989RlxW6+LwKXOVq0Zxj7bhd44lxVkJAZXdUiPvDi5Rxvf5VqSKPljTSHjXSk9nnHLY2h48Ttmfx79u3jMDKYPs/DNKjABsI1qtloEqpXz2UGJK4Wsp9bAtLGsrsRBW0KmhJNDxHc51tqz8vSbxT+NKPeH28FJZz+KeBydO7N7sSV7+D2dUcvBTZeWf/4ULY1l0lrFreo1J9SiPEUb3a5nrmxmobvm+t1FG6NWsuquG1P/AjzTsu+ISx98swc1vs57Tboss3nZ/bvZ7VW4rlKHbzVzTzI3+4ZObMOu9m6oXo1BugUvyXtg0xxD0Tv0nDeQ8cwFMnjzT2N58x2Z+Lbi2BZA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ss7rPTchi4gkC7BUagUubTY3J9sMYvojo3W6iSLipDI1GwUJD0y8+pOlV7h?=
 =?us-ascii?Q?WrkPodM0iho5Ea9+9vu11QOaTBeoqtWLbMlD9SuIR0RsHA4M3BBEvSIS/ta3?=
 =?us-ascii?Q?he3Ze6z767oaOlAhqcYdCisNsvyr+UaS8sTrUt9ckhKwz+KQ6ivFPAxy+ibH?=
 =?us-ascii?Q?Um+NC+W4uYDtA8tPYKJA2y8tdv3U+0GCUEk1vEQ9FQvCRPpURbJgM8Ldxrzn?=
 =?us-ascii?Q?SkRrRzsgiTD/hGOWWYssGgohdc5TmR4JyRq2E6arOK0KfO2SHw7C+w4LQ6bF?=
 =?us-ascii?Q?6GNFNrtnMc9XGzjU3KP4RRbS2/ayDB8YYlYLuASik81qZ6J6XhSZiIDmAMQa?=
 =?us-ascii?Q?1gJ4ITDXPoHnym+8lvbn/Wup0p/yMrh8WumXxNTR4XA4unLXRkv3cI+IbI+f?=
 =?us-ascii?Q?SYnY/cjtSC5+I0hB3HuXPMDZa13z1OoVrjsde2QdbsAxNu0U4zx+aGDXOTXQ?=
 =?us-ascii?Q?2vXAvQ8Z3V4xjzGZfc1GGUl2t8BunGBsQyli1oOdPUABLRo+N0PGCuQG7Nzn?=
 =?us-ascii?Q?0FycH2tf35TSMR6toZPR8pR2opkr49dQ3bYLPa0PSR31gSnrE9R3S9l303kb?=
 =?us-ascii?Q?zAWMz0CZOzDvm/FHkcL2tWtnc8QZF2+ud0oHJwQVm7EEVf75jac7WknLUy9n?=
 =?us-ascii?Q?6VHFAHWei9pabdN4jgyXPFvijq5/dDhOiIHksV1FrVazwlgcorErOlfW79WS?=
 =?us-ascii?Q?6Uo5g18eq6cMiB6XEuG0wh5hkTM1CW3ob5HHRvY4VsgVxN0518Uemnfs4Obj?=
 =?us-ascii?Q?x2MoHqkWyK7AMJoMVf8Y2fVyVeQUEawIS8s+Qnf9G++++rePe82lg6IytLF2?=
 =?us-ascii?Q?ovTYOs3z3SxB7AVCwdb0d+z51BUhDftGvQkcDesZkG3b1/vbyrmF67h6eKIw?=
 =?us-ascii?Q?NQyUw52ufMqaRp8tE3ggnOzcs+16OoI8vf+4DhwLxF2V7Ao8xLbfzgOXG9aD?=
 =?us-ascii?Q?EdPDIfUshH1IPX+4fLtmDGhEAPFfCbysrKFclfoKfCCnlAX7cafIsbCFnB7g?=
 =?us-ascii?Q?3FqUeSVmn276nrYkDttQw9Xsc7LTpdg537EP3fBVZ1hlRQi0cj2dz76B76Fo?=
 =?us-ascii?Q?99bkGaheEkG67gz/nF/3IE9Irk28esxj7aZ1giOWO9IH+FI5mZswpsYOWE6H?=
 =?us-ascii?Q?Ya9M4iq0vzkVUqNye6vYJRlzG377ROO0q2zbUmdqiDK4/t7IXX8AQbBUzCPH?=
 =?us-ascii?Q?hfgwv/2RDYCi5Rx89g1n+w8XULupQYGe7Elj/0xyYEsgnThFVe8C2raCxeIT?=
 =?us-ascii?Q?wSvpoEEp32IX45IwnJsV/MfNlGF8RUFzvz5xskO4T297CymZl/1b4aSItDHI?=
 =?us-ascii?Q?Ml+oFRzmR1s+I+VRegN1wSwi8tHgr6N0p/nDfBO8oWJJ5LFvmAnVoHWKwACX?=
 =?us-ascii?Q?wxEEGZkxqNMqTfRU36fORSKGqSc7e6PkX2WBJY+is9HB8vuI6KR1ZtiRGcka?=
 =?us-ascii?Q?6wEC0Y69gqmn6WZO8Mq6gtAJ54CqWmSK?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 703fce17-df2b-4608-7818-08da1a41bf54
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB2128.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 15:58:13.7172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0575
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi, I am quite interested in developing safe kernel modules with Rust for Linux, but it seems that the project hasn't added support for kernel mode socket programming yet (as I didn't find anything related to socket except for `SkBuff` in `kernel::net`). 
I am working on a high-performance network file system and looking for a way to use API such as `sock_create_kern` and send and receive network messages in the kernel with Rust for Linux. Could anyone please tell me if I am missing something or there is a workaround for this? 
Thanks! 
P.S. I would also like to join the zulip group. My email address is howardlau1999@hotmail.com. 
Cheers, 
Howard.
