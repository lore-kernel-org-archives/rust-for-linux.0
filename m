Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9F2D595B;
	Wed,  1 Apr 2026 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775020767; cv=fail; b=PcMjAVcKwz+KgYxgHX+5ajKHeAJqYWtRuafdVw1HMxeg3UQdMR2wad3ZLGd/kh4abGOFrmTIhmQjqfxxMMnVbs1Aco5HpDrE3PU+6YIcQBeV3HI8Y+2dcNQvxASmnaxCB9ryjheXajOim50Gk4s1Nhk7pBlKtk6YD6gsNb73okI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775020767; c=relaxed/simple;
	bh=RHTdLJcVsW2NawjcFUtCmlK/jav9b8IIuA788zJqSWM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=bjaXHC9hpLEPKGUeL7tDAtOhlKWBYIwU9AQJgLE7eX6/CcgaS3ux+Tc/vb4LTJXcc8qoAMDZfjIkBiNGAe9w/XiDWrVyrHyFxlpQy5x3v/8o6JeiVyfuLi9kCrs2JTCxdDqUOSlDim+O7Jhq02cIgqK9+HM/xXGxVbNjAlEAc4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UdUQECFb; arc=fail smtp.client-ip=52.101.61.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UdUQECFb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzAO/jV1RLeJeRWdqP+N/ibesGT9x87mfiUHvTm2DbnXaa+3s2pb8T0jBUYyAHA13wRla+T0GVImOc+txMu1H5Qu0f5Tk7kgGGhKImNmphDKlfR7CW2joBXg0KYiYgbpWomypbCrBZvDCq511UeOy2QZnjmFYL5vp1Vb7cKYIVvBd0syqBjuNpLhKNofiLzHtbkagVhMKZ7XbzQvAJBIaQ/CmX+W+ZBma05nYQr1fwjgNBFWYYXxHK/pLU6w5u6HVDK4QL4oqJdLaUCdL4pi+/fI50AFCIH5a9NxinoRYajjOiQL6yYoZCTZeM5ybl367OFoVdjZuEB4a92WJNdsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHTdLJcVsW2NawjcFUtCmlK/jav9b8IIuA788zJqSWM=;
 b=mkbpMbbrdRRMyBnXR2cwD+At7YAhaYfo4zphbHInck6g4BAIlCV26DHYe433SeLO+/2rucKAMAONPb8plv2HZfnr90BY5rvt4hF1n1cj9IQBJlcwzB0EyP1103XXUBucptmpHkmnn9FaUHyq2rbyfNb9G9NHAO5lBzcOH5bcC/USCdLmDwVkg6Eflh1DOqyZISdu3+WK8Sn4Zth5HqEL/sZvwH8bbZjKA7SHxRd+TIffLKSoGvJkQfnZ6rHxHcLqCo89J+D/u5FgbCR1cmDMbmA7/me69Lcc6mJFHY1iZokz13dDdbVrtnbQYLDC6Vi3tstF6gspUB4VLu3JbfE//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHTdLJcVsW2NawjcFUtCmlK/jav9b8IIuA788zJqSWM=;
 b=UdUQECFbEJKdLu9Ti8SaxO2Aqr2kvsJYmSzUQ1fkBD7KPZFjLEECMiGL25i5EFqDllozqjEysDcU2h0ZF9VmGXzeXWfSGnhfVcFRF5l6WWsWOLpZt8xccTbnza+xGU+jcQ1BnfAeUup9VjkonAAPg8aTOv2sFTGe4hO/cVMnNii6chTx6FeQw9QrnXu8njsLTB0PubgXn+Jm0BuAdsXfLRVxnkoa3oVuuruT3RCgoHpNVkl50w7nUBdS9qKZiO7278hEDdKL7Kbro1TaildsznrMQkoX7E9sDKsmhSLBVgpwcS82TbKJZhUsigj8YSSRz6RphjY0Nyey/ZNvZBRAvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 05:19:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 05:19:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:19:19 +0900
Message-Id: <DHHKCFIJUDDR.1DKCJEY9I81EL@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
Cc: "Jesung Yang via B4 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
 <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com> <DH939HK0611M.22A8T9BJ3NG8@gmail.com>
In-Reply-To: <DH939HK0611M.22A8T9BJ3NG8@gmail.com>
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: c17260d8-52f8-4afd-f325-08de8fae3bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ieQBovbDVqd6q9Hk1wxNfOU5f3vmQoNc3HRW3WWDEd2yaxlgTCZACsUAUmWI+lPuCD9ZY6ADC0Qg+Qck7dgxgnBR8whQVkerop2SpAn1fGIfvs2fLE87csmCGKjbygC5sckBV5nQhhw9Nb/hp25vWqFmBM4k1aWWFcf2dZwK73c6w0XuvREXSMr533H+NDTd9IpMmjcKqdGMO0vtVY0kLW54FjW/TieZio7A+RUXcS0r+BVrjpIEMM8jviGyQmQFdANtH269VjLPZudDoYuhNIueD19Sc+dljzXnv4V+MBGQXWWvObGsHfoAHW2xW/x958KqxwxThk+VnX2+qzp5B0YlExEIi17PcdkVcB25ZO1ghJbyZjL3Cxq3YmZCGgfuieDF3O9Jaqc74eOgahDyWw4DFKTmLCTM6cOABTjTABZIytR5Yy08KezZrbQem12b4bI3yu3owebScV4NKGT5m380P+Gm8cTLkpVNlGkY118iN7tS+bkNbtrjhSP2Zlub4bjGWgWSzRSjBjdtnF+AcWQXISI/cfsU694FFDTTQ1/rp4xC1UeEwT6XSqV1W530+na5D7CWMhVUnQe6oNoIsdmMxyqvIMbgIYqb4Xc538Zt7UFCbbq8ycgUR/CXAPZcZo34Nmdvp+DUE3rcZSYNYDdsTnDmS+UWd/e5M0YsMI4cuiF9fMNfFmkQpY0iEWiI2Bmr3pj6PwYQGds2nfuPCa+NmlGBuHaTQSL1gk2/Udk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2xPMEpISnYrbkVTMVk5NVkwYjc0TXhOYzMyUkpIRERSQzZ4NktEZFY2dlVy?=
 =?utf-8?B?cHdEMkM3Rkduckx6bEl1Y0N5N0JVSHpLRUJpNVpIUGhkTWp6RU1GTkNXRFZD?=
 =?utf-8?B?dGtlZzE5RG1WM3YyMHBmOXNyT2tzZjNTNVZieUZuSnFnckRwaFE2K0RDRHBk?=
 =?utf-8?B?Z0h0YnlXdm5hQThmTzRxOWtYK0laSDJWZzFYeGU2U0VxdWRiZEh6WXVIS0lK?=
 =?utf-8?B?bVpnWURzYTI4OExDelBVWG4rdVpXZERHQ3lnYmNFOGpNMHd0T0swZ2F6UEJ6?=
 =?utf-8?B?VkVHV0t1ZGJST04rK0FxMVZ2emEvVjdPR1N6cVNIczNLTlZyRTR2OG53Ynlk?=
 =?utf-8?B?MTFJeVAweU5pNXJ1cHZUeDRXSk1hejFPY3kxYmswbm5XV3djbUZ0N3lVVFBV?=
 =?utf-8?B?eHRZV0p0TFg0aW9LSjZ1a1JEd3AxYlFOVHF0L3FYMjh4eHl2RjExVlprMGtx?=
 =?utf-8?B?K0dpTWpvZFFxWWp1dzVFdFc2TklTN3hLNEtFRVAyVjB1NEdsaVhCQ3FoWVlz?=
 =?utf-8?B?bGx4WTJ4MEk4RnVudTZnRXNGN3cwWng5dldVbjZqZGliQlVLUllMbU4wTC9W?=
 =?utf-8?B?dXlLZTZiWkRyYjNkL0tkczZEZGdlL3JnRndaTEpjZXNqZGdwZUJlblRCYVFv?=
 =?utf-8?B?eFdaSXo2Wkk2d0hYcTFaOTJObU9kSUJ3bS9TNE9XSU1oR2ZDWlJDdmdqbHlK?=
 =?utf-8?B?K21qcHRDMVQzN1p0OFVxNU1LZ1R5cVN1SXQya0FOL0U0akFobTY3UEFDMVdG?=
 =?utf-8?B?ZXpEajFUd1ZVUVNHbFBzSHlmcVF6MjVQbFpLV2ovZ3VOaDdJeFd6QTFXUVN6?=
 =?utf-8?B?dENNcVZLNE5PVnhxdXpvZnMwbkpKa25ibUN0bTdYRm55UkVjcFIrbmc5cmp1?=
 =?utf-8?B?bzh6MlhrVThBQUdwTmQ0Mm8wYXJ0cFdzc3ZIUU1jc0kwdnlzY1l0NUM0VGRD?=
 =?utf-8?B?Q3VZRWxoSFIybEtYdU9NbFRvaktiWVU5ejVJWjc5a3FVeFNzMC9nTi9KL2oz?=
 =?utf-8?B?SW5xZGV2NzRkemJPODVNRGZ5ZzNVc0tkeC9rMzk4Vmh0OWVJUnFIUnhnSjJq?=
 =?utf-8?B?VWJZbW9QS3RzTTM2ZmNDQldrQjR2RHRPbmxLcG5xSytlN3g3NFpQcWRXQzZF?=
 =?utf-8?B?TElJSlVwRWx3djdvbVc1TUNyQkpiUnZlNWMzcWNQL0Rualc5YVlOL25aaDNs?=
 =?utf-8?B?dlNDYnlKY1ZPS0YwaTZuaVVya0xsSjljUE4zREsyU2FzWkVrTEhaYVU4MDF1?=
 =?utf-8?B?QUMrSENmQ3NpdS9vOGVtc202M1ZDcTFVOG5BZG9mTmRqbmY0WnRta3FzUG9z?=
 =?utf-8?B?b1RtNmdGWWRoNDJ6WnRURERDRSs2c3VZd0loeU1GblVXM1lNSGF5bXZ4bHlS?=
 =?utf-8?B?MmhzdmJPNmd2NE5lZ3BjcG0wNjFJa0NTWlg0ckkxNnpRNENFSHhPcTBMcVBp?=
 =?utf-8?B?OW52ckhmZ0RhdHZHWGVNcU50WTlURVlFVHFrWGwvN0NmUzJaZElITE9IQ3M0?=
 =?utf-8?B?NStNd2k2S0dMcWZkQU4rMnp2NklRREdielZpTU81S3MrL3VCM3ovZW9VOXQ4?=
 =?utf-8?B?YUhNNzBUNURnb0FXYkNtYU5NeFNNRk5XQkN0TFNUT2dKbWxBWStXWGxlTHI1?=
 =?utf-8?B?dWVWL1FZMVNrdi9iTGhnZ0h6aTBxby91V0NUMit2eDdhU0dtVXVBVjFhZUJi?=
 =?utf-8?B?YUF6NWRyYllNRVBMZmtKOHpEcXhjOUVZQlptTWxUM2VjWVZ5UmRwcWZvMll0?=
 =?utf-8?B?T0FVd3VyYmJvR1lxN3RQSElMc2xGMUFVZVBEdEt5RVEzWWFhdmt3dnFmbnV2?=
 =?utf-8?B?NHVQQ1U1bWVmSjdzSis1RkpzdVNvczlidy9qcTRCU003MTdXd2RHUi9CUXVu?=
 =?utf-8?B?OGFhcjRYQm1XeHFyTlRBZjM1MytGMGVlbkVXai9vRXlGNEVadCtRek4wRWNk?=
 =?utf-8?B?cUx2VmxVeWg3c2s2czF4ZDZmUTljWGFGUFlZM1lYU3dMMm1UZnJQVnNvalI4?=
 =?utf-8?B?MEQ4VXhsVWxyVHVDZWNvU2xTT01lWEZHOTlRblFqN0g5ZDVCcUdXdFc0cTc2?=
 =?utf-8?B?bjkzVGttNG1UMjVVeWZISW81c1FNY0hQSlpJRnJ1TENaYzRGdUJEVFlHZGtV?=
 =?utf-8?B?RDZmVXhsdHNMeEhKWmt3U2lpakxaWEx5aDFBS3JvTTlLbFY4T1k4MWlieGxZ?=
 =?utf-8?B?c1J4RDJkU2FYdW9OVTgweDJxSVZtSjhlU0tBZVRBOXVrYTMraUp1VVBsMm9B?=
 =?utf-8?B?eHY4UG0wV052Z01iaGFxQ3Bic2VUL3VCNXV2SVBaUWR6OXc4c2RQY2x6Z3VF?=
 =?utf-8?B?Vm9pbEIvdU5zNy9xcTF0NkpTUzZRS0tqa2ovTmdyOUdWYVBWZzlWd2MwdGhx?=
 =?utf-8?Q?VMR7T2JOvsgXZNJxy+lW8Pkfq2///5JTePsy6ni6XML4u?=
X-MS-Exchange-AntiSpam-MessageData-1: /V3LC69ZkqQwBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17260d8-52f8-4afd-f325-08de8fae3bcb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 05:19:22.4790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSKadEmeXMFcdWvB0ExWg+qkpTEVPHNbhwjEyguKWvrabr/QK7HrVWBfBJh2x3bgCwsICJNthmGAcSjzDHAbCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139

On Sun Mar 22, 2026 at 3:14 PM JST, Jesung Yang wrote:
> On Fri Mar 20, 2026 at 7:04 PM KST, Jesung Yang wrote:
> [...]
>> I'll update the implementation based on your feedback within this week,
>
> JFYI, the updated version can be found at:
>
> https://github.com/J3m3/linux/tree/tryfrom-into-macro.v6

Thanks, I could rebase my nova-core branch on top of it successfully.
Can you send a new version (maybe incorporating the `from` helper
attribute I suggested) to the list for review, and hopefully merging for
the next cycle?
