Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03EF395ACD
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757885; cv=fail; b=LKCdG8TxP5CurUU+NfGOXy0C2I3XHyLegcoteL+s2lA/aEDBn3KCYMvyNTjJC9jVM9xm49tRvrgmL9/SOJrwDSyXalwJjtDyBFsyKDsl8wR1JLelkPlURbXmUB+JZvqP+9xm78nldhJOAV3HLFJQ08VDLqDb9+SpVYlvlPRjYh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757885; c=relaxed/simple;
	bh=GJODImj25pvmERwnZ8c+5hHDvwVlLeNQsKmm1T0IIQM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cwUbCsO3tYQc2kIN24d2CwYo624J/kZJUekjR++/uAnuPvOp5R5NF1Q728BYZhim9RkoR5GDO6d2TTFQgnpRGVYFtWrCJpIINl/o3MlEi2pCQUUhhQrrrAwZV+BdFcwsyOZjTuhmQt+xQOJkBDf8pp0p9q9uxpZCZa2ZwPPxn6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=usNUb7Ec; arc=fail smtp.client-ip=40.107.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="usNUb7Ec"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3pg4kAX7qWDppFyvapJAPWnX9G3/BZWnjmip8weT1a5c+sQoqQQ53bArcyaUI8l/RXLC6vBzQwpjgc/SpkCpYGoBsCH1hErdZx+lMLspebquZ8AMZpRVmfefTgTreC5RsjowfrDQVbntttGorkk/EM3PsTdtN7yef37lKTI/RNoBZLVQjHynpNOebZqfvlnxFQZeOjnp3EVR5OZNKXcOmIJEYIMWxwc8NY4/bCXMT9nzbuQVgY+DporBlKJP86du2sVguhKvOkhfeOLiZOC4eLNh6DDshRTQ9aUcTY45818jwlYkdXhfpYGCWU1oEDbDKq96QehJx0oloT7UVSSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjahD3UsklhXR4VnStYQlqgLixhZ/oa+EySPhG65mVc=;
 b=u8UbPr5rkU8Tun7tJsp/x2O4FE1dllZrV5UYqFy2U3d1SDpn2eB9X/KQ5ckn3tWIXAL2HGM+58r39ARuVcyP2k5qX8N8kTnw2xaexRmNcHHFObTGytHyCRCGZf2DPwIzTjGZmxlM5v8mNvGkqq3QgQg8cdexCCt0jKL3vKb7VLl4HuG53cX5FughIxXENEq4rKWu5caE7NzHOaBC/mZ6SqDZFmnHKV00qtIDmeDpPsOFkW+9LY/Qxze9W8LhZojQQw44Nut92aaHXiY5d/5uYBkkJhhTAeRVcvWfmrubKVzRwpCHW+cDjeNMn+HTAy2Dz31B7LV2dJ3YXJjd6zsdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjahD3UsklhXR4VnStYQlqgLixhZ/oa+EySPhG65mVc=;
 b=usNUb7EcydxpHjaESU2bTOY9ADazAyK7QuX7LOSMFAWrctxxXfzfSPjl66G6wvP79usak8PFfzJq3cxXGumqKzNBB7kmOtLUhlIpzuGfDy8Q31fcnmLvIKFf61pFnOuJ3xQIqI0Kuir9D4BF0aRFGeAqV0zl469T0XyJ521zwx5vug3zPSyk/JYWsIVGUWXlbAZU6oxQeq4dz5OT/yKvzVhiqtFy7rKV2Zc4ZDjozHcBZbYkdQpM+e4F7bZ/oq9kTHvH5nMbufLxyR1JXMkaE0R1IJU6Ept3hRe8dbJodJ/GsP+JaWHKOQsWmJX4qmBberw9IQZ+SpWqOoD0aBXRGw==
Received: from BY3PR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:254::25)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 18:31:12 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::68) by BY3PR05CA0020.outlook.office365.com
 (2603:10b6:a03:254::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 18:31:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 18:31:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 11:30:47 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 11:30:45 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?=
	<work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH] rust: error: add remaining error codes
Date: Mon, 29 Jun 2026 13:30:22 -0500
Message-ID: <20260629183022.2709524-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb1e57d-4a5b-4d03-6d97-08ded60c98f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|23010399003|18002099003|11063799006|56012099006|921020|3023799007;
X-Microsoft-Antispam-Message-Info:
	UJbcdOl8TAfgDHf1awpR4Zo/pjjarNGLbCODIFE61jTIZLFXINbaW6BKoCLz5nSMdVsTpE/ivWuRAqo/QwIoqZGWJgVdvUaRKIi9m9aVpgbbbxVpjdYpzM4ztIMwW+hy/iENUGg5NpRmb6SCoKdvfD4cj4mGaHFissMT66zcU9NINORqY1vY88gRkT8fGC8MOFfjjFqggKJMlwOueT1va81LAO0jRQk/znd8g+UqgzDVk9WakJjKDFlVHWeC5bQOWexcZcHdAjLtf8D/jWzeRNivT7GvUyv1p/wRL69kJpkNWRNMu/KZA3T01bU5Izfm81/DzVrxZF+I9uJAy7qknC+X4xuzqpfNF7MYvhaPehbgbvDeo7eryZJiG4e80HJ/plwqSXvg6eezKFuJgJ7nsgTvd8FSwoXycl+CNMsJuiJZRCwBVWU3RbDW6EaWYaDgVnD4BgZzFNpBjEuVXCyoYOzhmWaw/M4Fc2Zebyq5s/S/VWV/pbEeKLOpsqoJGD8ALud0yt6oPnRKRIzzJi/FK8sFYxYIzxirMqIiy6LhQV7WwiZbHLbNOyTpaup9yp4FBa/QimG/XmqRFM5JZTq/2vRFvQ+kPvLnJDfvbxRDo3yJHSo4sqKpcJWI6+R9RXJV+PjknQihtk3VVeDDUJVaPy1YMKiECgM8/OajJSzQuA9XOustvAJ5ztChxMX0r81AJLs9ngV8BVGSH39LPN4r3FUnYOr9sGPl2ogq6HS3ezGGTxZHC8g0N7PicJkPaIKN
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(23010399003)(18002099003)(11063799006)(56012099006)(921020)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0SgvM1f0P6BP71PR0pjcKxguhIT8Jz9skK0zojZPACXCOhy6pQ9wvX6xM94TB/oCG8Lwl9yCxDS3a0C8Fp5AP4y1WFL1shptctuLaYnlzX1+SF8G1Kp9B0eUpZek4hkRv4ZtVa5JHLLxdGMdZxZyuKzwj7RLjSN4qylW+e+f0wxX/UzwCQNQ2UaEWBGBZIlffCfXee+YTT6xblr0C7f74ZDuoQ9yNQocjJROn47MClZgJ4U00Jbe+lsOwUNfrES48l4PQnAGkSBtKvXk2g9eI8rF/JkaSEMtPom75fMLWudM6ATI/nzeg3c7NOTAcdV476lYnvjy0Uim2ojc+8/2tl8A9EguAOCFx8W12SRWh0WHEE8lgtLpBvqsBS/KW30JPYlh0XpSAbBLEsdmEVhzPkOs5Zr++NojWnkfFx8tXVUJnYeO4ysG/kdFiN5ZXKdV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 18:31:12.6030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb1e57d-4a5b-4d03-6d97-08ded60c98f6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355

Add all of the remaining error codes from include/uapi/asm-generic/errno.h.

Previous updates to error.rs have been piecemeal -- adding single error
codes as needed.  Instead, we can avoid future problems by adding all
the remaining error code in one swoop.

EDEADLOCK and EWOULDBLOCK are intentionally left out: they are just
deprecated compatibility aliases of EDEADLK and EAGAIN, kept around for
non-Linux/POSIX code, and have no use in new kernel code.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/error.rs | 105 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index a56ba6309594..f3096d7c73ac 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -30,6 +30,8 @@ macro_rules! declare_err {
         };
     }
 
+    // From include/uapi/asm-generic/errno-base.h
+
     declare_err!(EPERM, "Operation not permitted.");
     declare_err!(ENOENT, "No such file or directory.");
     declare_err!(ESRCH, "No such process.");
@@ -64,9 +66,112 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+
+    // From include/uapi/asm-generic/errno.h
+
+    declare_err!(EDEADLK, "Resource deadlock would occur.");
+    declare_err!(ENAMETOOLONG, "File name too long.");
+    declare_err!(ENOLCK, "No record locks available.");
+    declare_err!(ENOSYS, "Invalid system call number.");
+    declare_err!(ENOTEMPTY, "Directory not empty.");
+    declare_err!(ELOOP, "Too many symbolic links encountered.");
+    declare_err!(ENOMSG, "No message of desired type.");
+    declare_err!(EIDRM, "Identifier removed.");
+    declare_err!(ECHRNG, "Channel number out of range.");
+    declare_err!(EL2NSYNC, "Level 2 not synchronized.");
+    declare_err!(EL3HLT, "Level 3 halted.");
+    declare_err!(EL3RST, "Level 3 reset.");
+    declare_err!(ELNRNG, "Link number out of range.");
+    declare_err!(EUNATCH, "Protocol driver not attached.");
+    declare_err!(ENOCSI, "No CSI structure available.");
+    declare_err!(EL2HLT, "Level 2 halted.");
+    declare_err!(EBADE, "Invalid exchange.");
+    declare_err!(EBADR, "Invalid request descriptor.");
+    declare_err!(EXFULL, "Exchange full.");
+    declare_err!(ENOANO, "No anode.");
+    declare_err!(EBADRQC, "Invalid request code.");
+    declare_err!(EBADSLT, "Invalid slot.");
+    declare_err!(EBFONT, "Bad font file format.");
+    declare_err!(ENOSTR, "Device not a stream.");
+    declare_err!(ENODATA, "No data available.");
+    declare_err!(ETIME, "Timer expired.");
+    declare_err!(ENOSR, "Out of streams resources.");
+    declare_err!(ENONET, "Machine is not on the network.");
+    declare_err!(ENOPKG, "Package not installed.");
+    declare_err!(EREMOTE, "Object is remote.");
+    declare_err!(ENOLINK, "Link has been severed.");
+    declare_err!(EADV, "Advertise error.");
+    declare_err!(ESRMNT, "Srmount error.");
+    declare_err!(ECOMM, "Communication error on send.");
+    declare_err!(EPROTO, "Protocol error.");
+    declare_err!(EMULTIHOP, "Multihop attempted.");
+    declare_err!(EDOTDOT, "RFS specific error.");
+    declare_err!(EBADMSG, "Not a data message.");
+    declare_err!(EFSBADCRC, "Bad CRC detected.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ENOTUNIQ, "Name not unique on network.");
+    declare_err!(EBADFD, "File descriptor in bad state.");
+    declare_err!(EREMCHG, "Remote address changed.");
+    declare_err!(ELIBACC, "Can not access a needed shared library.");
+    declare_err!(ELIBBAD, "Accessing a corrupted shared library.");
+    declare_err!(ELIBSCN, ".lib section in a.out corrupted.");
+    declare_err!(ELIBMAX, "Attempting to link in too many shared libraries.");
+    declare_err!(ELIBEXEC, "Cannot exec a shared library directly.");
+    declare_err!(EILSEQ, "Illegal byte sequence.");
+    declare_err!(ERESTART, "Interrupted system call should be restarted.");
+    declare_err!(ESTRPIPE, "Streams pipe error.");
+    declare_err!(EUSERS, "Too many users.");
+    declare_err!(ENOTSOCK, "Socket operation on non-socket.");
+    declare_err!(EDESTADDRREQ, "Destination address required.");
     declare_err!(EMSGSIZE, "Message too long.");
+    declare_err!(EPROTOTYPE, "Protocol wrong type for socket.");
+    declare_err!(ENOPROTOOPT, "Protocol not available.");
+    declare_err!(EPROTONOSUPPORT, "Protocol not supported.");
+    declare_err!(ESOCKTNOSUPPORT, "Socket type not supported.");
+    declare_err!(EOPNOTSUPP, "Operation not supported on transport endpoint.");
+    declare_err!(EPFNOSUPPORT, "Protocol family not supported.");
+    declare_err!(EAFNOSUPPORT, "Address family not supported by protocol.");
+    declare_err!(EADDRINUSE, "Address already in use.");
+    declare_err!(EADDRNOTAVAIL, "Cannot assign requested address.");
+    declare_err!(ENETDOWN, "Network is down.");
+    declare_err!(ENETUNREACH, "Network is unreachable.");
+    declare_err!(ENETRESET, "Network dropped connection because of reset.");
+    declare_err!(ECONNABORTED, "Software caused connection abort.");
+    declare_err!(ECONNRESET, "Connection reset by peer.");
+    declare_err!(ENOBUFS, "No buffer space available.");
+    declare_err!(EISCONN, "Transport endpoint is already connected.");
+    declare_err!(ENOTCONN, "Transport endpoint is not connected.");
+    declare_err!(ESHUTDOWN, "Cannot send after transport endpoint shutdown.");
+    declare_err!(ETOOMANYREFS, "Too many references: cannot splice.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
+    declare_err!(ECONNREFUSED, "Connection refused.");
+    declare_err!(EHOSTDOWN, "Host is down.");
+    declare_err!(EHOSTUNREACH, "No route to host.");
+    declare_err!(EALREADY, "Operation already in progress.");
+    declare_err!(EINPROGRESS, "Operation now in progress.");
+    declare_err!(ESTALE, "Stale file handle.");
+    declare_err!(EUCLEAN, "Structure needs cleaning.");
+    declare_err!(EFSCORRUPTED, "Filesystem is corrupted.");
+    declare_err!(ENOTNAM, "Not a XENIX named type file.");
+    declare_err!(ENAVAIL, "No XENIX semaphores available.");
+    declare_err!(EISNAM, "Is a named type file.");
+    declare_err!(EREMOTEIO, "Remote I/O error.");
+    declare_err!(EDQUOT, "Quota exceeded.");
+    declare_err!(ENOMEDIUM, "No medium found.");
+    declare_err!(EMEDIUMTYPE, "Wrong medium type.");
+    declare_err!(ECANCELED, "Operation Canceled.");
+    declare_err!(ENOKEY, "Required key not available.");
+    declare_err!(EKEYEXPIRED, "Key has expired.");
+    declare_err!(EKEYREVOKED, "Key has been revoked.");
+    declare_err!(EKEYREJECTED, "Key was rejected by service.");
+    declare_err!(EOWNERDEAD, "Owner died.");
+    declare_err!(ENOTRECOVERABLE, "State not recoverable.");
+    declare_err!(ERFKILL, "Operation not possible due to RF-kill.");
+    declare_err!(EHWPOISON, "Memory page has hardware error.");
+    declare_err!(EFTYPE, "Wrong file type for the intended operation.");
+
+    // From include/linux/errno.h
+
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.54.0

