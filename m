Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021087.outbound.protection.outlook.com [52.101.100.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E9C3264FF;
	Thu, 25 Jun 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403782; cv=fail; b=YBDPbzaVMWL4lecPO3aJvIFYSkFWQ15IvbqdhGRDFzlo2XgMz5F8APlXKpj8uWpzbLL67j4uD+0zrcV5JZ8SHlWpRMlUQ7DwpTbtErQCwaQDKO9zwDOvM7qakpndqRY3JXp+iX+8URlFbhgwTl75qbmK5WItvECvCXEbviItL3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403782; c=relaxed/simple;
	bh=2AZcIfWnd5X4dGdBCFthkrTCCp7dX3xbub64RfSWMgI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cdzK3i0JfWw2xAFxWtMZ9xBeECvLws0olHd//v3cHlUm/EkQqM1b4uho5Kt/xmciSOPNjraTRILPRygmYv9+Nx6JKQytaaTkAJLMTSfknoIMT32PxQfMx72KQCAvjAZSa6DIkNSig/qKWKBLubzyaBE7rsFdjGq+rnnldoHfFmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=u1B+PeMP; arc=fail smtp.client-ip=52.101.100.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="u1B+PeMP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNM5JbRpW3efkRRnBQMpaSmiFnlSYuyeVpxf7COfP4uiUHbDiPeK5Xjiyb3MhtcmiyIXY8ahY9zXCXkFlk+18ta3MZsES1s6v7j3Yy/8PjckuYhxr/+lpgKU/KP1HKQHCkRpwCmw1butgODOW0gBBdvJir/cZ/MbXD4fdFR4tq3iccI9FtxPSPFyHkhqdhk9ZQVteCO7UT6w1S92kkL0G82qNU1fWTuc6N3dEBLFdKSc7cahA7+ZSyVEAlDfoUX8F7lMO9X5t+MYFXWrT28dIGMr76aCASkCsxGtqk2ypUb6ZH6IhjAHF2yBzDUOxUI37zI+4UV4RYwFf6wN2xweGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E03MW3/uljlEes2k8P526MQj+4Ar7JiehNllG7hbDmM=;
 b=jQiqa2ntKjNyejd3G4ala4gbqpnIJivfH5opb7T2obUTV0+yX7LjQBW6+3aBWlRcx4I2ky5HG6Ba8mFCQqQBC142xyTOV/KnJfPbuvlb8vLFhazv7w4V8ybgslVhs9uZZVuPRZnvohTGM9mEpPSpDzfeH+lBtKtQSLw46ZXF4VKRfee7K8xWR388pHQNx+qbBXCKa5WA7ZmQyKZNqZH8OzQm1mOarAK74ndooRgR6p1f8Eh01l6z4f8dQYTRE6RAm1oHIE9ACj1qjYk0ToYXtMLC6N7OIvkhnOJx+LD4s59tgcOX3/6M4XRFlgKu10i53EvXs9KWi5Cs2g8Pt8B4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E03MW3/uljlEes2k8P526MQj+4Ar7JiehNllG7hbDmM=;
 b=u1B+PeMPRWHSftPZIFtteXdKWxAwJZJXeey/K/oFTQ+AU/ZR3GQCKzJdrcjkfUjfW/OG1XZj+6RMB9tSTAji+AJGzifLEvhzbsxHYGzqDO2JEhgIR4hiGJQotuZ8Y4/y8TI46saKJ6wrY39olpWbBIfhuIJ9+yqED9BHr0OfBnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB9152.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:270::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 16:09:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 16:09:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 17:09:36 +0100
Message-Id: <DJI9EMV1BPI8.FXUXL303AKNG@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: USB: add rust.rs to USB subsystem file
 list
From: "Gary Guo" <gary@garyguo.net>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <2026062533-achiness-outsell-a93a@gregkh>
In-Reply-To: <2026062533-achiness-outsell-a93a@gregkh>
X-ClientProxiedBy: LO4P123CA0491.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: 712dd3ab-5361-458d-96cb-08ded2d4273f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10070799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	loRPkzYwweLzq4dN+tttWGdRummMpXStt72gbMY1IcjuWoR0yULi+A7r6K02LF1D9j6c27Ma3NIWDvS6zITvzk57vLx6Yl3piV47kqtAieRnBA1X9EIwmW4yHHA5JUVmJNj0vO6XjKSeivzAjp0ZaUhDcXiaScIfUXuvPVZTzr4zNkGat5pq2LLWyOLy1vfNaZAJ/gqjEJIp5o9Zz8/qHV7PrsDwb/nGZFzCkA8cQrv4Onlb/2x2BZTO3esSujXUtl3Tn37Vw9vI9pJ2axY+bfMX/V9lO8NaCOzwoSuA7n26QmSnci2jdXOYg9CGJGCHHynreoESKxcY2BrR1XJl6KekLKDGIIK+ZNVtfYfRt/XwKPDOdAEwUyTtbODkhCk3eXLQo8Bkrqs4/YS7kSdsOI3xDvyNyStKeqewocx64qXq8eIckD+HPQwqZS80rulpXT9E6HgtcX0u1g8UwvFqEnateIgsaWkjSbjzIUTqeOat7HucDpnHx5B1zZs3otqO7Xg/Y/BbT3bDNKn4S2NkuS86IKlzJGf8iZLymWEGTw5lUfv+iQ3hxevahe6XS1btuN+xWhokVG2IEb7Gjm5ZZvVCeES4EeXaeqSrlSzlY0gB8NyCHsDEuSY7rvFI0HWHGpmOzcXQzhcOTq2xIHionpe7NPgzE2XTDJCmfYkf4yk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10070799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGYvaTJVZHhQOFBwVHFpTW9BYkRQRU9haUp3NENLRlJDMnNEWkpjaUFZV2Rv?=
 =?utf-8?B?cVN0L0lRM3ZUNmxZL3Y1Y1ZDU2ZFL1RsYUJoSGZuakpLK0s1TG5qVHlSOHJl?=
 =?utf-8?B?cVF0RWt3akFSaFN2dEFHYnV4akdUekxWSllJYUVORThQaGhxT2gzWnl0Um5r?=
 =?utf-8?B?Q3dtMlFGeTdLUUdWd2c2dUF3c2ZKVnRnSk9ZYzVlRWx4aDVhYnFnV0tLMm5M?=
 =?utf-8?B?eHVmckdTTDRCa1I3OU5QenFkZXQ0clpnbnhTVmZjNXg0VVJIdGlWNEMzV0Ru?=
 =?utf-8?B?Mnc3ZGJYUmtxWnVkekZZNUJza3pjS2VubG9qNXNLTkE4ZGRkSEx2bGFpcVpU?=
 =?utf-8?B?MFAvNFBSemQva1I5N2NvaUpiUEpOdkhmN1FMZWZZR29VTytxYmQ4ZG40VFFI?=
 =?utf-8?B?ai9NSXVKQ3pES2xicUc2Vi9SZ0NsY0VqMjRwQ3p6RWFkRWNsQXN1N1pmbDk3?=
 =?utf-8?B?cjFrWHMwVFhnU3NkV3J6b0FqT2I4QXhRZkk5emwrdmNhdXh1YWVHaitoVFdO?=
 =?utf-8?B?ekVKRXl6UWYwblNITlNKeU9RMFE2UmVWcVpqSmRhNkJFbXpKUGRwaUU3RGo5?=
 =?utf-8?B?R1BFcSt3Rm9CRTA0RVY2V1RKSGI2bVJ6MUZzVmtFaWoyMEh4Y2RBUTNUUm5t?=
 =?utf-8?B?aUZBQTAxOU9JNFNxdUZRenQ1NWRkMUw2N3JFZUNEbnQ2aWduMkJ5UlVRMW1t?=
 =?utf-8?B?OWthcWZ3MVpLNmI0U3ZrMERjVm80MldTM0ZUaUdqaStVZWNIamFVZ0pUVkNi?=
 =?utf-8?B?azNMcmFJODl4a203Q3BDS2NBbVNndSs1UlowQWg4WHVBdis3YkVFb29pZlc2?=
 =?utf-8?B?YmhQK2dFRENpOTZKem5LdTlEYnBuZVR1VC9yczNtSXBQQVFLWGJJNm9obUhQ?=
 =?utf-8?B?ZlJ1ZE1zbXBWd0RqQXQyZE1LRWQ1TVdreC91YS9jNFRnSERRZ0h2QmZPdXpl?=
 =?utf-8?B?eUZtUERGcWhRRDAxOVlSbXd6OWl0Q0VBKzhvMDdYSWhXR1k4WGtHUGtoejkx?=
 =?utf-8?B?VU1RaDlMbFB2QTY2VGRqVDB4QktSd1Q3S2hKcFpFcERpT1hTN1lpc0xVQW1o?=
 =?utf-8?B?R0VTSDZsL2toUjJwaGVIa1hrOC9DaEhJVGtqMThONUVvSm5MMDVnLzdQZWY4?=
 =?utf-8?B?UDFPWDVmTU9GbVJxV3R1UnplYlh3VzFVem0remVQdGltTTh5RENDbmF0ZFZ4?=
 =?utf-8?B?MlRNL01mdHZvSzlhSlAxU0FaQStiYlRnZDRCR0FKTXJrVzcwVVA2WmFlaG9m?=
 =?utf-8?B?NVdMNUF3d0trc1hoR2Z4bW9IYXA2UnRhczdiZHk3SVBROHRrT3h1Y3crbVRS?=
 =?utf-8?B?c2s5cElKSjFNSk1LU3A1N0taZ2tYbWY3cElYME5IUUxnS2Q0VkI1SEpSeHho?=
 =?utf-8?B?SThHMHROYUZkMnRRNmFjeElIVjFSSU1SZm1aQ09PM3IwekFDWi9ORlVFdTFj?=
 =?utf-8?B?WVArZUFia3lrZkFYZE1tMlZjazNGZ2IyTmFjOG8vY3puMDJsZGNkWlUwYmVh?=
 =?utf-8?B?VzJ4cWlMdXp3a1MwbjRUcjVHdzZGSU1NOERFY2E1dWZCQmhwYnNjdkEzWEZl?=
 =?utf-8?B?WTJNMUl1UXpuSkg3RlhKamFNZGFwOW5rclRaQmZ4TVg3Z0lQTDV5ZmEwZ1BY?=
 =?utf-8?B?aWw3UEtoejd6N2VSNTc2b0tBTkRQK1k3OVhsd0NtTlVTRWFBT2VYVXppNk5i?=
 =?utf-8?B?SG9CUjluU1l6V25kcklld01KQk9pb3d3WkUwWWJxa3g0cng5V29NNkhQZk45?=
 =?utf-8?B?NGhaMnRkbU5GcmwrdEc1TkNjVUpWa0tjcE04NHNsK3dCaE96NTY1UGJmRDFh?=
 =?utf-8?B?d0lIaDYrejFQRUlEK2YxbXdJd0M0YzZINVcraVRSbzQvS3RRakJHalEzZXRp?=
 =?utf-8?B?cGJ4TnliWGhDL2NQT2EzTFdnRnVtQ2gvVmQzZWdnQm1wR2kzYjlIbElLN05X?=
 =?utf-8?B?bDF1Y1BERTFDdzBEYm9uSTJhTEQzZ3pudW5BdWZYcHhuUHZOS0RJL1RmQmhF?=
 =?utf-8?B?ckZKc2MrUnc5bEZMOHk5d25VckVkT0dUeUtPbnFOekc2emRrZW9pVVBCVita?=
 =?utf-8?B?clU4eTVnUHFoN0s4amE1UkRoUmF3MFBzeDZiR0gxMnVCaTRyNjI0UmRNTm1q?=
 =?utf-8?B?ZllJVDgrVzNkbXAzSlZNdGJ3MmFrRjlnZ21wa1IvSGEwMkpVdStWWktHQXgr?=
 =?utf-8?B?dCtsOEUreG4raDVPbmpvalFEaDlhLzJIWDVselEwU29ZR1U3QlpYOVhwZVRD?=
 =?utf-8?B?bDZaT2xmWEVLUzh4WWRQcVErUnhTa2NEdmZmM1p1Rk1pektGTGRVaWlKcXUr?=
 =?utf-8?B?RXpUUGE4cGFSTFpqTVdSZ0dZeFczMkJZVUx5bUhUWE9BbitmNjc1Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 712dd3ab-5361-458d-96cb-08ded2d4273f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:09:36.7197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTTqamJo1L8WC9w/y0gWRDzKj7/BCbeM4e7J+HzP1cq+4k34q1RhgzYitMuZLzlK+gopOSwAvBfsr/yIqV7w+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9152

On Thu Jun 25, 2026 at 4:08 PM BST, Greg Kroah-Hartman wrote:
> As was recently noted on the rust-for-linux list, the usb.rs file is not
> listed as part of the USB SUBSYSTEM files, which can cause changes to it
> to be not sent to the proper list and people.  Fix this up by adding it
> to the USB SUBSYSTEM file list
>
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

The subject should be "usb.rs" instead of "rust.rs".

Best,
Gary

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3eeb134cb611..f477e348ecc0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28054,6 +28054,7 @@ F:	include/dt-bindings/usb/
>  F:	include/linux/usb.h
>  F:	include/linux/usb/
>  F:	include/uapi/linux/usb/
> +F:	rust/kernel/usb.rs
> =20
>  USB TYPEC BUS FOR ALTERNATE MODES
>  M:	Heikki Krogerus <heikki.krogerus@linux.intel.com>


