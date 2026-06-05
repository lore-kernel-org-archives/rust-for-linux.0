Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020098.outbound.protection.outlook.com [52.101.195.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5008629A32D
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641306; cv=fail; b=gMyb8E42IjoGTDXCAAJ7KEMBowXgE/y//oZeSme4BzZyeOa297gBSMJkIKDw5k4o+pRskfYGvWQUo3noZc0r6lbCMwI86jmG1Yg+GVNAl4qEv6jmZkWddNrzgdN+UmPGwDru8NoODdea28cFGDQ9SoP6hGAfzkYUOYR6Th0Y+Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641306; c=relaxed/simple;
	bh=aa85Gmk6+/cDmYgHLNwGSB8jnnQfW50lX7c1+jlcGoU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=kRn5kacy99RAQU4eCRAfajoesrBeivSOEF+gUJg/4EITWpMjsco7LeFM/xQmjRIFTAmPRG4C+yi0D5pc21/7iWpalhqr+yeW7jXYJJJY+7LWa1LsQHy+s/2kOpxaSZ4EaeDaUDXTL0baTwBdwVS73d2ukJKrWcmvSgZpWS11D7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=OdyzqzFr; arc=fail smtp.client-ip=52.101.195.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="OdyzqzFr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhxOZ4dUQ2HYMI5rfkAvSox/uzyGV/sNvEAwU+dsi+nYTjAMHgIQCgwHZpZGUG9jiwT1OkYChxCez0lszfSrp2GcU02s6YVtOttQX/ZnZlT69STo287cE8porK+SkSn+dOdezea2V6wP4HusVxsTX2KGrt2p6x6Kep0lfg1x3xHqIyU3abH2Smdr/Au7wjjKkTxNLjFQkwcA5h4OncBTrL/kIX1NwYSI54LdKLuGXAwHngWeRwigjMgoEY3D4VN9upLISDUjc0SP30ZPTB1CVzuxg8qZXZamXo8Pg7B9k89Moh0YJVIsW5OF4XiSIsMqV/ANtXKBw+OGZmJPmcEDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IevZ/XZX9se2w59tP+6s2YFd2Gw/FtVSjs4z43DD/mI=;
 b=TIzaTqJLzyEMUwvLZOR1/E9EvZCcqIObpjBx/QQ9BYr79YTdskRHvJUiZHut3mD3fysvkcneM/8iK2Ajo1vNCfA5dQ118RdbtcXsEbCNF7/0QTrmSE2SJUiMmT8az3eTBupQSkQIPaHyY3UCoXI5cIeV9+BIZkzetg9lkgxoUb3vNSMKhhriNRmUvWfnibVtgZarbKGssfDoNz8ssSwgIsR3mdlgNU9pa8lNUZE0kB6AcN2pMj1bGXHqQ5P/KVZIP4SpbZfojyb5PaLnBN9jE/3jK4CWPUNFY48TwARAi6g0tjwUfGwTJwn58T7x+ZFjIs1h0z8lbNTUseho1yH0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IevZ/XZX9se2w59tP+6s2YFd2Gw/FtVSjs4z43DD/mI=;
 b=OdyzqzFrTNdSwTkeG4nPyuVPfUaHekYf+gi0dN9OxqegDyw9PgjjlBPKhfpdJ96oAWiyNeFd6bM8QRA0h/cs6D33XizmrTdX/rsptJVi8vHbl6dLXGN85QurdkPCASSoTIGxUC8x5l9sRboLuBHl64gt36xfoP6mUDUjzfL6wZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6736.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 06:35:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 06:35:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 07:34:59 +0100
Message-Id: <DJ0WNS8TFUO3.1JN11CL2UTXBK@garyguo.net>
Subject: Re: [PATCH 0/1] rust: revocable: Fix racing access during
 revocation
From: "Gary Guo" <gary@garyguo.net>
To: "Boqun Feng" <boqun@kernel.org>, "Yuan Tan" <ytan089@ucr.edu>
Cc: <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <zhiyunq@cs.ucr.edu>, <ardalan@uci.edu>, <pgovind2@uci.edu>,
 <dzueck@uci.edu>
X-Mailer: aerc 0.21.0
References: <cover.1780635248.git.ytan089@ucr.edu>
 <aiJoM6FrFVGYFJOI@tardis-2.local>
In-Reply-To: <aiJoM6FrFVGYFJOI@tardis-2.local>
X-ClientProxiedBy: PR3P191CA0046.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1548f4-3d46-4423-8925-08dec2cc9210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FMslLpVSYNAaMh4I4KXP+ogaicuu28WjRvMlH/cWtE9BYHozXaLYRhnj8Dl6zZQeFoGZqKL7/nfYHZL9AXW3s5dVz+Dz2bEyaYPqz3RJX51y2M3NwrTUA1HJvN1YmlpHrNlASjlqGKAjyVWzWVGQaNnGqRkEZ6g/TtOz5MpEsLIG3Ulsvk+pyWrZ4VFc579w3UWlcCkul2kUAX5b2Po9V/tlK4XN1KkRt1S4fmXvcdQIQdV65Lg/xSSRKO3v0JFwwSwZ6cQyl81RFesdAQ0oRrlJDzU4nlOvflW51NH64bHQxuVAnteFq8dXZzKxzuRpYbMq24jezq5QQ45sj5otM6eo9+K+UHbtMmiQkBuWPVdj1QwgQrwsMUlEYxJnBGGZIQYC3Ic7UawhpefdwJzneCd4xsCZCSZE775j9Od7jijNrRM3kKsksLrj3KXX6eIs8HpcHm0cq7KjVJ/NLailKMMfoT+kY0hx20gFI3iJH87wTfKDsYmTKRZ9e7IYtJ3UHT6luEGtCaenxSqfRvLRDEOM507NVCPenVFsZsKs/flAmCdAKJ6pxTQddFavpScON0xXn8AfksSln3LXLZL9ZOhTtG3G1pjp42ZVWTRzy56jrBVlKj2I+DcYM5NyiXEmbgAGhwBoNmUmfShGhVf0Tq4OHyBqV49lGdlHU7Vzxtl3ko5BOnV+GfVJExlqpHYscW9JYJfnsT0y5NKWs0B5hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUUzQzMzWU9oWmdIOGlBOUFWdFVZbVp2N1J4QVh2NW9OZjRpcUhEenVHWm5C?=
 =?utf-8?B?QnlGRkt5V3ZQcjZJUE5sdmk2bHlEbHY1VklHMFlFWFZCRzNlM2JEMEMwL21i?=
 =?utf-8?B?eVdiejRiNTZJQjYyNE9GRXZselRMRWJKY0RlenFFQVZ5U0gwenBkQW02RTAx?=
 =?utf-8?B?dWZheFFWUVR4dDB6MUV5M0dQK1JDU3lYZnVZZmJveEE1WC8wZXZ4dXhmYkVl?=
 =?utf-8?B?VkNkTUtaQ2pJcHk4b0dZQktjYy9HbjdEM28zR01nOVJpMllFSmtCSDNObDFT?=
 =?utf-8?B?bGFHK0hxMUhOemY0ZFhZbWpScWpHRnJqK3lQZ05lRk4vWFRmYlhKMVB3Yk5J?=
 =?utf-8?B?K2kwMUpZT0JSQ095NG1lUzFzVkJOOU1YYklrdVF3M3l0cHJKcGptZkV5c1o0?=
 =?utf-8?B?bUdGc1U1MXlZeWNpUkRGNDJ1YlFMclpUWEJsVTVaTHNiWUxwd28rOG9vWVU2?=
 =?utf-8?B?OGlzMzF5OUcwNkNiVDRVOUpHS2wyRW9kWmI3SUFSeW1EWXJ4K3liMDgzZGtm?=
 =?utf-8?B?NmppSlpiNkNhdFJ0cHAyUGRXb0NUK0dJU2FmU1NtREVxRm1ONS9kdFI1Q1JI?=
 =?utf-8?B?bGdnMG1mZGN1QjhMQXJYSGRVTmIybGNoVXdyVXhLNjhQS0xBYmJpa01iYjRr?=
 =?utf-8?B?T3oxelordW5kL0hwZXRQc1E4RnRPMUNpZHg4bURyTEIrSExCa01VdzhKSk9M?=
 =?utf-8?B?Nk9BZjFWbjFzZG1SUWRnSDFkZTI2U3NnSUd0eEMvL01VQzV3ZktlLzE5RmhU?=
 =?utf-8?B?VHY4ZWl5aHl2SWtRZjlZWFhkQUFiY2lwVWlJRzE1QW53L2FPZ3JHTVBmTTBu?=
 =?utf-8?B?ZXN5TExRTlFFdjk0UENVcklVbDc1Ri9TelFHQldZdDRkZXB0R2Z3RnhqWUYr?=
 =?utf-8?B?NjlOR3AwLzJJa0FydVFTRmxYNTlaT25oNWhBMGt1cnFpTkgrbXY0TVBqa0Vo?=
 =?utf-8?B?SitTaHF4VVNUN0puRlR4WmdZbFRVWHZQeGdOckFGb09QWlByUllFcGdSTXB2?=
 =?utf-8?B?UGRBSzN2a1FqS2Zvdzg1OFRtZkJvcmNGKzJKNlYzdHNFWmxmQU82cCtMem5z?=
 =?utf-8?B?c0ZxUzdYckZjSytPa1RKeW4ySk1CWEY3dFVGY0J0MHVKVGEvczJDRHpNUjNR?=
 =?utf-8?B?WDhicTJaajRXL1REQXkyb3UzbjVVV1ZSNU9pNzd0QnFCbmJjNG84Ykh4OXNT?=
 =?utf-8?B?VjlIdGpqZE00SEU1QWNld1pwVnd4amJMNGwvWHJIajJ1YU5EVitxU1JGZ0R0?=
 =?utf-8?B?bXN0VVJNSmtDOHo5b0dzYlpvUEk3dm16Uk93dFlpZUpVUzhvNnJOdnJwN0Fo?=
 =?utf-8?B?MVRpZXJ2S3BvbnJiMzJ2Z1c3N0dicXNadkdFbjRCVmx6T0tKc0xJOVpkNGZy?=
 =?utf-8?B?Wi9rQkt0empnUU4ySmVYRzB5eWlKNUtTdUx6dndxY2tBbXFLOTA3QkRZRm5a?=
 =?utf-8?B?ZTJ3TEx5b3VLOXhQUjFqL3lzMTdRQVdUQjBwSXJsekxNZXo4NTNsMzEwZjE4?=
 =?utf-8?B?bldKcUgzVjFiVjRUWXB1YStPNnU2RXIzVC9vaWtHMVBsdHdZTnZmd1pnSGE3?=
 =?utf-8?B?T2VQWHFrTnQzaVNGOS9EOEsrSjFYaE1mSElQalRPUXpPalVOTUdqRWwvYnJ2?=
 =?utf-8?B?c0xvMHFqWEtLd1AyU3dsZTFuR0hBRlV3aTU5S3E2aVB0UFNDV2JvRmpYaDB2?=
 =?utf-8?B?enlLUVJLZkNOYU91RzRYVXptbFRHMGpFV29qN0N0aCtOYTNrcWhDLyszb1F2?=
 =?utf-8?B?Szh3eFRiUm5xVDlwMGFXbUpGRGlDNzNsdGdmRGJtaWxmR09CMmJrYWJ2SEVz?=
 =?utf-8?B?SHprUG5jNWozTjFsbzZTSmsvWnZnZUR3QkNWbWsyL2p5dTk5d0pqWEZFQzB1?=
 =?utf-8?B?bGJtSmtQaDdxdHFQY09DWS9ha1dhQW1IOHB2OWJYOU9ZU2FTT3lCVDVqeVR3?=
 =?utf-8?B?R1NIc1FPR1ZMS1YyZjdtVWhnd2Rlb0ZrWmJCaGJ1SHF1Q2NBL01TdW9uZVpB?=
 =?utf-8?B?ZjMzTkJvTGJDczJ3RlhpVlNqNW8vVHd1SDlxYjRDRnJaTzlaS0VmMVpjYW8x?=
 =?utf-8?B?TWFBMzBDSVdzRndXRXNkNEpKWDJrTzVpWnl6MG4yT3ptY09vTGVNalZCakpw?=
 =?utf-8?B?YXNqaWJGdWZ1Sm1UU1ozem9lWVlMclR5V1dRVkM0bEkyOCtPRllONTJtRWZK?=
 =?utf-8?B?dE1qRUJSd2p6NHVFbmR6QS9NWDFOaFh1MGwrdDhFU1V3MlpRdXdMYmNZalNu?=
 =?utf-8?B?ZCt2MnZpSnRyaXl3UE5jckpSQW1VSGRBTEJabmxXeDIvaVpGblZMcVZyV1k0?=
 =?utf-8?Q?b8lEiDNvwo2PT6aJZa?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1548f4-3d46-4423-8925-08dec2cc9210
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 06:35:01.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vv9er8I+uCAB5SdxHS4qQHl5KG0STnrVQYD1u2i1Ri7jGPj6aRUOXt94q315wm0bO9M7P2XVxB4YfLJPWPEgFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6736

On Fri Jun 5, 2026 at 7:09 AM BST, Boqun Feng wrote:
> On Thu, Jun 04, 2026 at 10:02:46PM -0700, Yuan Tan wrote:
>> Hi Linux kernel maintainers,
>>=20
>> We are developing a tool called FerroLens to detect potential unsound
>> behavior in Rust code in the Linux kernel. FerroLens reported the follow=
ing
>> bug in rust/kernel/revocable.rs.
>>=20
>> There is a potential race condition between the call to
>> revoke_internal/no_sync and try_access/try_access_with_guard on the same
>> object. This occurs due to the use of Ordering::Relaxed to synchronize o=
n
>> is_available.
>>=20
>> The race occurs in the following scenario:
>>=20
>> Thread A (Revoker)
>> 1. is_available.swap(false, Relaxed)
>> 2. synchronize_rcu() begins
>>=20
>> Thread B (reader)
>> 3. executes rcu_read_lock().
>> 4. is_available.load(Relaxed) returns true (stale value).
>>=20
>> Thread A
>> 5. synchronize_rcu() decides it doesn't need to wait for Thread B becaus=
e
>>    B's critical section started after A's grace period began
>
> This part is impossible because:
>
> 	https://docs.kernel.org/RCU/Design/Requirements/Requirements.html#grace-=
period-guarantee
>
> Does your tool understand Linux kernel memory model?

Here's a correctness proof with LKMM litmus test (it's basically just that
guarantee, which I am somewhat surprised that doesn't have an in-tree litmu=
s
test for).

$ cat litmus-tests/revocable.litmus
C revocable

(*
 * Result: Never
 *)

{
is_available=3D1;
data_valid=3D1;
}

P0(int *is_available, int *data_valid) // Revoker
{
        WRITE_ONCE(*is_available, 0);
        synchronize_rcu();
        WRITE_ONCE(*data_valid, 0);
}

P1(int *is_available, int *data_valid) // Reader
{
        int r0;
        int r1;

        rcu_read_lock();
        r0 =3D READ_ONCE(*is_available);
        r1 =3D READ_ONCE(*data_valid);
        rcu_read_unlock();
}

exists (1:r0=3D1 /\ 1:r1=3D0) (* Bad outcome. *)

$ herd7 -conf linux-kernel.cfg litmus-tests/revocable.litmus
Test revocable Allowed
States 3
1:r0=3D0; 1:r1=3D0;
1:r0=3D0; 1:r1=3D1;
1:r0=3D1; 1:r1=3D1;
No
Witnesses
Positive: 0 Negative: 3
Condition exists (1:r0=3D1 /\ 1:r1=3D0)
Observation revocable Never 0 3
Time revocable 0.01
Hash=3D645c0c4bc27ad56fdeb295e68326f479

Best,
Gary
