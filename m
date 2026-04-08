Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010021.outbound.protection.outlook.com [52.101.193.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215282D0C97;
	Wed,  8 Apr 2026 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613231; cv=fail; b=D8S9L5pe0GQy8jbEp+BgXZHerTPhWR713OOTEDVfNe7Quw2URdDFxuSWBWrSVsZ3znxpltRtfF0AbIbcwwO90n7mg3YHNa8tqsjVvrt3x9wXW2tNQMaYZ+9YZnIzrvi4x+dfOxOzilC4TLOivqjQM5nTYOq3LtXrZJPMIlEnpn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613231; c=relaxed/simple;
	bh=NB0VVJtM5w5JH4hY9mF0yTcNjRB9Li/NNATW+0uX3BY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Uc638o603l/Q7bW4Z0OnBGkVdwHUQuhdNRcMxKEUiC4ijyhtcL0xjKzi0DCAxe0FysyrcOCZDHfWLhA/vSjU3NPydXGmn++hU6oTSMkbatl0/Uyle+PBwIBH5Rr227BJPi1Upt9xzUGvXsIT1nSAGTAB2b/I7MLascEM83vcgTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qpiwG6S8; arc=fail smtp.client-ip=52.101.193.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qpiwG6S8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeHoMKtHC7gFf1qHy7Iv8+2gs+dcKaQ1/X7tBM6FE5IMhKYJziMUDNszncE25Zaw25RyM7RrXidTXBqbWQtbw1O8IhXVk/Sci6Km3XdlrIoS1GjHO83xT+i74lhrd6F6NW1L5oAGD1ZdfsO6l75k3UyRnJJ5BHuBhgmvLOKtX7M3Y7na+g+ScOFtuwm9hQW4mTI342BpL4DT2TUpb3Vvgpn5swa/1qOfaP4rCjbf0FOK+X9FtPacnWOrdUt/WGsYAgFBFajxwTkHj8YnQeKotjHjW0fXz3PDC0rKHE22eSMSaQsEa2LW9k/rLyKypNg714N7c889B/gXFP+qjbc9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIIF43xmMV/HohQBigAiSIJrhfuzE7jXtNdJ64go/vQ=;
 b=L81IXACOYqxLTdi2o1iIjbrPWErzXcRUhoZZzY8Lw9U653vvfkofd6pfqJQfaJeKg3v2OUBJFI8BSSo/drrWt+PJ9Hi/EfzcL2PbDF5sCfN0ZU+o0RX9T3e+8nOVfEiY8Q6CGp5ZobEFgq4fyvGm1zeLupXdCa7xq7Ecmo3NJIG77WyvaxZ2e5E3AztooDi6eqomLF2H2NhbTMBRWDaNzBcjHHSOTim3fzpwIdBqtlhjGiWxSMPchPWm8GR451RNplnLuVnXjXUpJWfb34/2dJQ/9b/hvElExWINqN8E8Bb/iyGISZNln6/DlFtikdfBYu665vpW0MmajkFYqELhzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIIF43xmMV/HohQBigAiSIJrhfuzE7jXtNdJ64go/vQ=;
 b=qpiwG6S8ECdbNT/XuFYbJi+hOnof4R7DeAo89vjHi57/j3nhqdLyKOX5FjAvUSruLi/4ksShjEphWym4iwkccjN3VNbh0ajFYB/45cPJ7kkMrf3O65l/WQs+2Pgg57wYVi8QdiahMCuVyBIPEVulmSVODXc/UyI7+q+p244aApdjAvoB3d3xnfZNyh/984dMZmUPfuhVXpt6/jxYGDO2qyBWJMkv+8slI2JTJK8IfhtH7O31Waq1nkApMOGeKf6qn6vQExeAhByaq2U89HaopnPtZq2gWEsDQwHUNT0mgXyuvhnbHWt60DXOj1Akfud79g2KafLkk0vClEshy15ygQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 01:53:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 01:53:45 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:53:41 +0900
Message-Id: <DHNECT154XL9.3LWK3PLMTMRHH@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 21/31] gpu: nova-core: Hopper/Blackwell: add FSP
 send/receive messaging
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-22-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-22-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: a68d7f3d-e624-4b67-6388-08de9511aaec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z2h7GecB6WOkIlfkBclA7dN8YQVOHqgwICC9Jt/0BoBpuU7Astnx7n7G3wf0k34cNnnqjtCcasuPlt3Xp9aYK2RSA6iDxjJ5YlDkrCNOrT9Jg8NQoAnxDvkQgCgpjARCJbcXQL5mzE/cUhvtHDThAxwW4IqF3NlAeXiERUw08TI3hKWbh2fmD7bro7NvsKIq+e9tHQKCes1rc3vBceLh/QTgXH0/nu9wGjTQkHNR0YdKVJieqKtniOQO7bENPm+13wiUTVaI2bidzhEvoE4mqEDN30dVUxGc7Y4t6zUjd33lThfpJN1tju9HyXx8CZP98ywgvFC/EeCiZ0Htl+C3SU/YBdzDsiR5rG6pZ6/uCT/B7FBpMT+mRGeZ41yCc4VNljq4XeBkwrnUN1dsZIkIfT0nAQnirNKjjDM0SW50TEu5NjgeXazJCcolVVDoHSCdk68B164Ai0UX94jrChiG0pMGKZt6jiet2VS43wQSmTe6HS9jtx4X9aPsCxkjijz2zySQUmPHhPjqE+XU2Yu5kxYoJkbNjTKbqn8UN0y37y4wFXLjQ6846QhtgM8Zw3q8THoUnUYhoa3uE+t/k241nhBMV3fY3ZjPP2I6OpZcuWVbX1WG5/aVd6N0FQo6rpVlqg7j2a/oDxPvrfCDlid6FqSw56azwI7Ah7XLb4e1qrXgIbTj5p7BIhLxkmm95VcVzjhh0p/LRhH8Yp3z5C47ta/OSqWJVAjn/rSDrPEwhE0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckFFTEh5QjB2VCs5TitaTGk4UmV3YmZsczhrSUM5MVRVaG5UUysvSkJyVnMv?=
 =?utf-8?B?dkYxaDFqcXRqMkQ0NDB5VGdlSG5adFo1cVBvSkRjK3Nlc2lWeHp2ZFk3YlFY?=
 =?utf-8?B?dWk5KytBaWdNd2wweU9rVlZIVzU5NzR3NlpybmQ5L01Ubk9sZUpzVzJ5aFVl?=
 =?utf-8?B?clZJdS95cFc4NkVTbW9FeW0xeU5RMjRiakNQdDN3bVUyMWpHVWFLbnZGTlJS?=
 =?utf-8?B?MG9Xb0dTVUJlc3REaDlrdUpzRFdER0FweWFST0tBN3M4VmFlNUEzcXVHMWVw?=
 =?utf-8?B?c2VjZFJCRmhCYWpyWEFMS25wZ0xMVElFUDZnQUZMS3BLSElMQUE2OWR1L05E?=
 =?utf-8?B?RzlReDhhbmhidXRLWGxWUnBmU3E4SHVIcmV5cFpxbzduMk5SOEFlUEFGQjJQ?=
 =?utf-8?B?NlN4cHZRRTVaaFM0dzZzb0lWaW8vSDk0TXlKK05oajVBVW9RTkZ5N0FyU2ZM?=
 =?utf-8?B?WmROM2JHQmlWVUVway91c3FkcXlIQXhSTXJZWUZnUy9mRDNOSjNkeHhxejIr?=
 =?utf-8?B?S2Qxa08zU2ZvQkVTM0k1LzNsUHJMSTBMOGlHWTFQM1FoaXpNN0RjcFFBbEVU?=
 =?utf-8?B?bjRYY1VheWdtMVdnMHpPNUw5ZnRIOFdPWWtJdFUzOTFwVWxraEwyRGwrYVJZ?=
 =?utf-8?B?OEQ5bVZqOVdQZkFFNFZBYmUrdDZ4bFoxVzNEUUJCK20rMHlkOGVUZ2U1emQw?=
 =?utf-8?B?TmRQRUgwakdKMVVPdjA1M255K2EzUWg2Q0JSRkszZU9UODhjSlQ1OHdGdm5G?=
 =?utf-8?B?d1NwVzZvQWNiNjMwazlGbjBhSWVCNS9NbVM1Z0RrTFc5ZWlhdFpKdmZCRHh2?=
 =?utf-8?B?b0krdkxUTFptR1JRQ2tBZkQxdlZmYVlBVHpSbFhTY0ZlYlFWR1VZUnJnU1Rz?=
 =?utf-8?B?amFUN3NUdEI2cUkrSXNRYmdSd0ZzTEkycnhBaURIc3BiQ3hkTlVXT0hHNkVU?=
 =?utf-8?B?dVlzV3dkYWd0ZnJERVcvbjVsTnk1SVRlcjJINCsxZWx1SlVaVjhTUkI4RkQ4?=
 =?utf-8?B?RVVMOXNvbzFnUkE0eGlUd1hNTk0zbWVxVFdqVC9uNTIzL1g1VlhTU0pPQS9z?=
 =?utf-8?B?bENIbDlzaktCWDg1Z0w4T212UWNzMGt6U2ErdC85NEppQlBMeFluVExCNGVJ?=
 =?utf-8?B?MzgzekU2TWZzdU9vNnkyMGZQQVJhR2Q0cnhnaG5vWDBoRzVnY05ycUEweWJ5?=
 =?utf-8?B?YUMxQm82Z1JUZzZuOHFwK0djZjUrYlVtL2R1aGxDcTJ6Smd2TnJVTitHd0Ry?=
 =?utf-8?B?Y1huNG51V2VmVkE1ZUJ5Vmh2M1BxZmNVTmZmcWFraE9WMjFJMVQzbFVSSlZ0?=
 =?utf-8?B?QXV4Uzd2SE1JdFUwRXVFS0tpbkhFa09sTVVCRU90L1F0eC9VMnBiQ29IckhL?=
 =?utf-8?B?bkc1M3Bsdm11aWxTZUU4UFhMVVMwaGtHYm1jeGRJeWNDTG9HQjE5U1hPV3d3?=
 =?utf-8?B?cWZSbVJzc2pwOTY1RGhOb2xWa1lHd0YvdEZ3NGJlMndIYUtaMFhWbW54QXAr?=
 =?utf-8?B?bGlONUJTcENTQ2VPMVBFMEFKTndZTmtGeWNQVDAzb0tJMjZZYmVWcmNNRUV0?=
 =?utf-8?B?eEErU0hsckpNdGUzMldtK0Q5UDB3VkFmcURUUjlmVWpCZVlxV1JCbkswQnF5?=
 =?utf-8?B?SXBzamVTY3dJUnZtWWpsYzdkM1Z0Q05vcTFldDJGb280eEhJZjE1TmMvaU8r?=
 =?utf-8?B?U3BCSEVrU3hlNWg1eTllK1hkdXdzRHZmeC9kRlB6Q3g0Kyt4RGVWQnZqSFgw?=
 =?utf-8?B?cTBMRWtjS3VqRHllZHh1M1NGMWJiS0FlTno0eWVFNjh3eW96aTFsVzFZcGk1?=
 =?utf-8?B?UXk4ZnAvaHpaOStSZDZnbUxMZG9LYXVzUU1FeWpKRFhzUDFsd0t0WHFDTERC?=
 =?utf-8?B?YlZRVWgrV09jd3orR2pZKzJrSXlIVkVhOEdLeElNZkVhTUVsM291U0Nac25u?=
 =?utf-8?B?MEt2anFvWi9pREppTE9ra3NhbnhLQ01WVFcxQ3BKRytiNlR3L3I2ZURiM0E4?=
 =?utf-8?B?eDhPOXE3UHQzaDlYeDMyYytNbHZrcVRITHk1VHk2MDhwYXphQmY4QkdsT1dl?=
 =?utf-8?B?cEJ3WTQzSXJYUm0wSVdJaXpjSU5kL0FJcVVaNGk4cmYwWjVYeTRESU9zbEww?=
 =?utf-8?B?MFp3cS92V0dQUE9kcTJoT3BPUjBZNlIwSnhtMXhzd2s0NGhXaXZvMWtqdkxN?=
 =?utf-8?B?U0JFTTUyMDFWZmhrczE2Z1dMeWpMTHVGS3NuVWcrK2lpMkhwMGJaQmFBQTg4?=
 =?utf-8?B?V3lXK01xS0Z3aGZPTGZ3dXBTeFNIMCszYjhsNHoxNm4zVDZ1Tk8zdndrUVdt?=
 =?utf-8?B?L2ZRdDhpMFRMTFF5dnlWMlRVeER6eFkwcmg0czc2QTAzRUwwbkdZY08wa3BD?=
 =?utf-8?Q?Zm+ah9B7KmGM6QXzXPOu+zdADQaZkB0C/uh8hQujsSBS7?=
X-MS-Exchange-AntiSpam-MessageData-1: hBXzTiCzAE1aeQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68d7f3d-e624-4b67-6388-08de9511aaec
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 01:53:45.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O006sdKxl1W91WFRAqwSjF2n/3J5sq3Y9mQF2oHgT851tWMqzKdIYWK0ZGuvHXhROIRUD2079KvzzeGi0HcljQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index bbf89c70a425..931d806c3db8 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -19,6 +19,15 @@
> =20
>  use crate::regs;
> =20
> +use crate::mctp::{
> +    MctpHeader,
> +    NvdmHeader,
> +    NvdmType, //
> +};
> +
> +/// FSP message timeout in milliseconds.
> +const FSP_MSG_TIMEOUT_MS: i64 =3D 2000;
> +
>  /// FSP secure boot completion timeout in milliseconds.
>  ///
>  /// GB20x requires a longer timeout than Hopper/GB10x.
> @@ -124,6 +133,37 @@ pub(crate) struct FmcSignatures {
>      public_key: [u8; FSP_PKEY_SIZE],
>      signature: [u8; FSP_SIG_SIZE],
>  }
> +
> +/// FSP Command Response payload structure.
> +/// NVDM_PAYLOAD_COMMAND_RESPONSE structure.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct NvdmPayloadCommandResponse {
> +    task_id: u32,
> +    command_nvdm_type: u32,
> +    error_code: u32,
> +}
> +
> +/// Complete FSP response structure with MCTP and NVDM headers.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct FspResponse {
> +    mctp_header: u32,
> +    nvdm_header: u32,
> +    response: NvdmPayloadCommandResponse,
> +}
> +
> +// SAFETY: FspResponse is a packed C struct with only integral fields.
> +unsafe impl FromBytes for FspResponse {}
> +
> +/// Trait implemented by types representing a message to send to FSP.
> +///
> +/// This provides [`Fsp::send_sync_fsp`] with the information it needs t=
o send
> +/// a given message, following the same pattern as GSP's `CommandToGsp`.
> +pub(crate) trait MessageToFsp: AsBytes {
> +    /// NVDM type identifying this message to FSP.
> +    const NVDM_TYPE: u32;
> +}

A trait is useful to provide some kind of polymorphism. This trait is
only ever implemented by `FspMessage` (which strangely is added in a
different patch), so it seems pretty pointless (unless we have plans to
implement it on other types, but this series doesn't do it).

>  /// FSP interface for Hopper/Blackwell GPUs.
>  pub(crate) struct Fsp;
> =20
> @@ -224,4 +264,87 @@ pub(crate) fn extract_fmc_signatures(
> =20
>          Ok(signatures)
>      }
> +
> +    /// Send message to FSP and wait for response.
> +    #[expect(dead_code)]
> +    fn send_sync_fsp<M>(
> +        dev: &device::Device<device::Bound>,
> +        bar: &crate::driver::Bar0,
> +        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,

Please import relevant items, this is very heavy to read (applies to
other patches in the series as well).
