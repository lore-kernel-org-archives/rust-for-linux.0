Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179733A1C9;
	Tue, 10 Feb 2026 02:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691596; cv=fail; b=iGSmEVsdfPg+rlTwS9xqTl+5c/ZrHAnT/N4Q2m/kbtqjd+kchfbpr89JW53281wImIonv6FzCJex9j1bzF70yYZ1n8wbuwUy6/Bu8wwcLtHVvPgYEXlhW5UprqiUPpGqEqLoh965woAx447ul0990nmnQ0VEHGcMFwKe8zVBVuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691596; c=relaxed/simple;
	bh=HWd9IwpCrUXqR7dfS2u14hBdjEAYZCLH0SiUYJGxns4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUaBsn8HOb0+knTtCb8yBkV1IS/d3m2ZrVUiVz7fZW44osMyOLhNNM5RMgHUWOcqUwfKHP2RU6qjjQBLkFbzyT69RLHowxfVn9LQmPgdK56rpIbO99Hi7qCY6Br93u8+Mt+uefX1CnmBxe+UQ9S9xy8mH5Yee/XXk1Os9/lBPtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QrycLQTZ; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QrycLQTZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzAJ2MJr6LIjuGWm8C1BPmpCjfQ6DEx3L5yFW0lMsB3lQYk/7WGpa3w8QatFzSblUDQwMQFgKCuutn1NWaQoPQzeKOAl7Q2exOtIYoKdO7JDnLZh6G2KAS883DytlrvWsxIQRVWWUlyOsXGVPOluzPOPtB2v58UpQIW2niaNMwQLb4s4vJrMNyCOBzaS8UBzJ42U/CjlaaFDsknLinSsS2CWSTRYNW2Vc2psLNwTZCPSj5rPIZ6yU2TLp7G5RILoqALa/gPu9Jm8KJE67p+P4DDlVtgJciLU/ieow/h67Zb8SQu9cFB6zCo+VcxMvt5/E9cKvRUa+IEJZjnLi6gOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD20Yi9ZNK5oTd2CkE+fdOZg0waIS/6zSDxO5l2iLnE=;
 b=G1Z8fjsM786/VFhTNxPXlG9YMJD1D0CCqq962xFwHtDxtz2yRLgkSGz8WDAbUrjjMC6zctfZ6BHHSHLyGWWSOiBCAJqLvxEFcz04o+EtUibe+4VtB5u8r76PqT2WwxhUBZhHPASSVcVETcbIt8N40VVSE+ZwyjZeJfNeatgyuaI+gquXYye79erK+H4V0ODrXmlkbd0sIqSpMIx2fVfyquoxCpYd/vLvlmyx+ZBfUR0aUhn3gCjcVYjyUuviyetarBYwTn5oZiSx4InHfgc8n4ACYvuyUMEL71Ng/17P3p7YiiWj6bBgETlHzLMho0E06/n5TFkYk76s3lxif5lidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD20Yi9ZNK5oTd2CkE+fdOZg0waIS/6zSDxO5l2iLnE=;
 b=QrycLQTZXLfbvkQ6XNnJDGHUddpJlfXDDe/iQJ2YfZlaTWbfyZbDckT9oTATKt3yfyGcEQL2k0yOEARmk8Zde+UG6NAZcA7+r01mNurF+USfvUusZKL5XhnOoL/+eWz7dfk0GRf/8/laH8D+u1NkrGGXManJqOwAmxFxFfEE4Ncn7xBWVd2XjxRm6/42nUdYHdn6UJ3Nhm4N2RjpgwB9Dq8VsiR2yszIdol/KfpjOU4zAGlgJ98bTJ+trGwMFXobjN2mov+atB+i59cSfiScdgfQYnWBRbQtd/++LraAhZM4dha0fFuRbMbwH0V+qPkwiMJKeqLkcCaxQXrZtjWAkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:18 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 11/33] gpu: nova-core: factor out a section_name_eq() function
Date: Mon,  9 Feb 2026 18:45:38 -0800
Message-ID: <20260210024601.593248-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 65233638-1a59-4b40-8600-08de684e901f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1crbpEWJ+t1SYAlke+aAZedT5Ts3e4IEnxi3CeMBJEwz6Pn5JOaGEn+6qmBm?=
 =?us-ascii?Q?GeSSk8qA4aIwpPUP3Hw/aVrLoSUzq/MO1E7/r3hkrPtS0gteUlSFxc68XSEo?=
 =?us-ascii?Q?qZ6YITQnzob/WDlXeezUuisFVZ1HHTEQ/jTjI/Ntr5Dkd5v6Kceqh+i2jT+S?=
 =?us-ascii?Q?Slpi9J2cR/0gW5F255EXi2yXXZPLvyqF7DX+EvWNcWEKHdJC5Xiqz5oHTGpF?=
 =?us-ascii?Q?9fNpeFXz4QfCJHrtz83T3r2ltlbtJNq9zH+nSgmE20TQhN65WWcTkdwOslXu?=
 =?us-ascii?Q?EPwH3wdZwGoX1Sn50oMiFyxSHhPARRTmHoLgW7WDbBsh6PokMqWXzX1853vh?=
 =?us-ascii?Q?NOgzp2xv7mQ/eWCvwOeNx81pT9YTQ7wy9S3sO4VhT6yiBCsPLIFQbI3mGX7O?=
 =?us-ascii?Q?iXB9cYjHdE+Ti2YkO9IRCk0LzXasqcUUVrQpKvAmoC64KJAI+oM+1KD8l/Ye?=
 =?us-ascii?Q?4ajSSdqXDxpeaMs8MjBF5AptUs9dIfNnPVGJyTz7WQICpZDa96uJcZiA9s5K?=
 =?us-ascii?Q?Hi9yMvaDkT8PoacN98RNNfK2Zwlg8IaqVlA6+279hsIKsc/f80uwv28Ipuuv?=
 =?us-ascii?Q?RU1G21z1FRhmAHKcCXBgYa/MIj5MkqIMc8Jo7sPZk6nMzcjr/1CYaEZ3jOZy?=
 =?us-ascii?Q?YHM3y2KQl0rMmKoJmKj6uum0LsHf4l3otSwpFjGK77x1WMJ/nRi0XFr/NCjo?=
 =?us-ascii?Q?TZZchM0RHaTZzWmpy+punPwdyXKJq/tnyo1NESFIF3yP6zcXklGUXPeA8kgV?=
 =?us-ascii?Q?Q6zNseSRkRt1+tixfmp2kCVLz/SlZnazxvRMlVcgkQNi2XQgLeFI7gGRzEnd?=
 =?us-ascii?Q?rR5Zhpt8xDxVNlim4f4eY59MCkDuF9zl7zCodBwlIXPxXnyCAM7UYNn1Eita?=
 =?us-ascii?Q?UH85GqOeQakdqpbME0Vr+AjHxYgmpzNiVKQbOqw1jN9P/bMQuNHti7Ai35Xc?=
 =?us-ascii?Q?+/RU5KYFmnIgNVZE+9Oifg9brKbqmpuso+p7DyOa40MYUsCspe3l/iGu4Cr/?=
 =?us-ascii?Q?LHCHgttQvvY5T+Ydfm5IOTfnl6pyFdAlzMZSbJ3b1kgZHOupivbrv+zdR777?=
 =?us-ascii?Q?8eSkBIVZD4uQERmg438ud5XNYHJmOhnwclMMCViAsyAYQ4YBY5xuOyoZfENs?=
 =?us-ascii?Q?DFUkhR3gS9+tgi9s375WV+c8uh2dzvFsFtYmfoBOeFlXfsJTILJ3fCBcY8SV?=
 =?us-ascii?Q?3SZBbs0QPrAQ8EhxNUiOVgMOp2QxGfwE84Qg3eB4nV29LSvIC6j4JWH7xAZ4?=
 =?us-ascii?Q?byS4ERvS7mn+V0lcvSjUdpmqb3qpOMBOyzA5grEfVZriuEb3/02MSxQQwd8j?=
 =?us-ascii?Q?C94rRBlyRL2gynOy1mCh1dBp3DtzlYmb2jhRSCNulYwLvWmWIFzj00Fxilva?=
 =?us-ascii?Q?4NnwAx4dHjoXT9HeAo7cp+kZCzw7RavwKmuORaaUKICNn1uATZrBGhK8d3gg?=
 =?us-ascii?Q?YHP3PHuGHmFxUVJqWnyjRpakWN0e5Leb5vKyTcJ5S+dy6a/uQi0OeOI4dOLU?=
 =?us-ascii?Q?XQSnyloXxv5dOqBGztJv9c7C64B7GH2RJYTNaWOKPzqzvIG3pYDqad8LNq3L?=
 =?us-ascii?Q?Q27FDvKTACVpba+LlTk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dzAYO0oBxfCV1gUuQq3TCyO4SKRsMs5Jw3qv+epn9d7u8k3OV9kl9YEkO/lc?=
 =?us-ascii?Q?/GADX/mVxL0ZB3X3ndV4/FG0bVlBG8T1Flgefao3pAr6gGi4OkJTK2FvRowi?=
 =?us-ascii?Q?UZ03eVKQSCx0/vS+v3nVYnx/wS/lWICkz+rRJ4LY70Qd6cpYZHp8nR2/JWFV?=
 =?us-ascii?Q?Aj6LkQW7k5wyyu2oJYLdm2bcIogobAuI6L0BZHJiwi8HAsD1zb4tkfIVrtXD?=
 =?us-ascii?Q?hqyTvMyMeqwECZ9QaRsbioCA1aGrh9jGFBEOd5xjPRw+OjXzc+Xqr4U+c91u?=
 =?us-ascii?Q?qSoKv2i192HI/eI1v8KWkZuvdxXzCBe/jptd8gQtQj14zzT4yCHbuhFM3nPr?=
 =?us-ascii?Q?+Gci+lRZfiC5BCeyKrHhrq6Qg2I7+XUa5SlfTLWifkmcRkS0dpNyfOkzBRcb?=
 =?us-ascii?Q?KlWHLP0Nx16mfIwpKgrpTdxqBXL4M6WQgNZ52PJvmb7tDGGpP86hxmfuIxJG?=
 =?us-ascii?Q?79nJTyIXNFvVHd5QRtgBtCpE63cM96jww4V4X+57bpzb1yShuM5L7XIXvoHD?=
 =?us-ascii?Q?Xx+gMvy3ckM1KRj3HwlJu0xlMTDhZlTtxqbRfffi6Fakwy1ZyYf0Exxrss5L?=
 =?us-ascii?Q?osGRXRM0+QZnf/se+/v6iv3jYitRKWWqL10fpFodOacersQwsIRmUjLWU6gN?=
 =?us-ascii?Q?xMfADcvZMA3sokFPX/Dbi0+5rGXJVIQW9ahrXlVs5UCZ8Bh1gxCs+GRaX3wz?=
 =?us-ascii?Q?8mS6trutX6xHx3LmBT2RfqTZF4AOiKcKrBbfNYatVA9muhn1SfxxN3zpfS3C?=
 =?us-ascii?Q?OuZ+4GinXulrXpOw3zsVLJmNlEO7oJNWGjT00KJa2SvpZbA+y4ul0eTCta7C?=
 =?us-ascii?Q?YwEEDPRyjCeohw4zOFYTKNwAxbXCbaRNSFwBSl4k+Ye2p0nagAElyYfJsx/Z?=
 =?us-ascii?Q?2dGsOf2idLroiX/mmK2T8Q9WVBClXcOwjfrf1G99I7mVFxes6/pigzVH/hWX?=
 =?us-ascii?Q?7TfltD1rdHESXR2XFa+9SA6ZY4qUD1k12cZVweEyD9GjKkKUvoDZxS6cxC9L?=
 =?us-ascii?Q?qc1X37Skn8zgAyFMXfqKvRs/VmNHW0lBhHW4gnGKacr1Qt3NEiXvmm74JIJx?=
 =?us-ascii?Q?h+OuPfMqVVmnSKQPGJPYdn/rTOaLQNEIXIC/HV26YWJbFzqxpHnLBgNMFqLm?=
 =?us-ascii?Q?1WBy5pJaGbGFxvRhQOycWNEDR+qblhtSo7Px2mh20YJfIgcZgI6swpAKULLC?=
 =?us-ascii?Q?GsdBkPot0ddIpusKQmuYg8x4qidSYjIf8glWPj20lW6vcaXPKXebiapKwSoo?=
 =?us-ascii?Q?PdwTfX0gm1/RUbVWC9yrfvlIIk/lE6TfwObOSlMdGAa2uq0wTalWpgvLulYv?=
 =?us-ascii?Q?VscnFffGhpK2astMwF65CTIS4FmQ0bU7IPJrga++qvO2K38vzYulvdXBZ9CT?=
 =?us-ascii?Q?9TWX9z80Qw7P4tgDDOUN9JFLHAIuB6wq6O6JZwzSRRNvjdujE4VuoBZ7Lgb+?=
 =?us-ascii?Q?8FfejTgj0cJd1CjmcgZIXQn73blg25zUMl9TFeq5uMInx1cHMwykpeMJQBUe?=
 =?us-ascii?Q?g3WScEabtVMWLru3+NCjnEVPh8XkbCJjkcOp7XXAsxpmojN+b1TQzoRoJwMw?=
 =?us-ascii?Q?oN5P+uJWit3cIU/Uwp2t0AQ93WXVx5A37c48fnAdJn6aDXJ3h7+g6RbIdnyD?=
 =?us-ascii?Q?h+Peu5LpfIUWutv0zTlGbEYm/XtIWLMf3Ik0CwC7XO/OuVl1YHReBj0HeCS2?=
 =?us-ascii?Q?yiAutHHuZJ2fBtninM3h7yCkh3fnae3Fv7Pys9Vb2TGAf4/Gwbe05WGxO5Ti?=
 =?us-ascii?Q?2BSi0/wNSA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65233638-1a59-4b40-8600-08de684e901f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:16.9516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HI/3cu0cQPrGDJLsUsSRQ3m9V7EAC8MJTXvAdNEcqRNkXaBqKQOCzDnvGexZ1SklG6v7KKA+htXW9CHwNEMhbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a0201ac8ccb4..72cefc3142ea 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -464,6 +464,13 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Returns a NULL-terminated string from the ELF image at `offset`.
+    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
+        let idx = usize::try_from(offset).ok()?;
+        let bytes = elf.get(idx..)?;
+        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -490,32 +497,15 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
             .and_then(Elf64SHdr::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
+        shdr.find_map(|sh| {
             let hdr = Elf64SHdr::from_bytes(sh)?;
+            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+            let section_name = elf_str(elf, name_offset)?;
+
+            if section_name != name {
+                return None;
+            }
+
             let start = usize::try_from(hdr.0.sh_offset).ok()?;
             let end = usize::try_from(hdr.0.sh_size)
                 .ok()
-- 
2.53.0

