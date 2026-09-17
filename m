Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECEA2A1BF;
	Thu, 17 Sep 2026 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618819; cv=none; b=o1/iQSoiKpMsD2dmYu0Feg9GF+mHYHVxL58hFCPx+oNBT+C+LdNtNJucp4wRVqzLiWFDdcL4yJVfGNNJUY75f99LD/UrkQbckGrJcNA4Rx2FywfoG6DM9esjqQ75ua3peYC4RlZGjjyxhII3x/+w1g52uh9+vnwI2Gtogs5WVng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618819; c=relaxed/simple;
	bh=c+dWV+UdWy1jg/iyWwxBbbRWOaKy/42C2XDL1a8fRWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHZLn/cGL4i/2WugcDbHCUpI+Vgu5IiWkCD5EQzNiNVQmU+LAKMbj5iy0YauO/Imyll/IX2Uhonczk3vAUFgvQXVOhmrSyqzXfetAgp967LUuxlclJZtIKTP0Qft+zRanson+RY9J5mJ09NAtJFGbobdkiLHhzfGdxYm1fMnUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.pku.edu.cn; spf=pass smtp.mailfrom=stu.pku.edu.cn; dkim=pass (1024-bit key) header.d=stu.pku.edu.cn header.i=@stu.pku.edu.cn header.b=ZfI6W8Ll; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=stu.pku.edu.cn header.i=@stu.pku.edu.cn header.b="ZfI6W8Ll"
Received: from localhost.localdomain (unknown [106.120.124.5])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e15bf297;
	Thu, 17 Sep 2026 12:14:54 +0800 (GMT+08:00)
From: Chunfeng Song <springbreeze@stu.pku.edu.cn>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	wang lian <lianux.mm@gmail.com>,
	Chris Mason <clm@meta.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: fix typo in bindings
Date: Thu, 17 Sep 2026 04:14:53 +0000
Message-ID: <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ad931a5203a1kunm20b7c1833457b8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh5CVkMaHx1CHUhLTRkdHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS01VSklLVUpJT1VOWVdZFhoPEhUdFFlBWU9LSFVKS0hKTk
	xOVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZfI6W8LlcXeKxdPqx+CEAyUieHk1j1nLNXWylKvf5zhBgfONsgUUfASYPiYVJ02dLkBE4vOt/nSOtjGumJpwRIio5DvZWsGAQbhBxJjW4PesxOue92UOYmsLMITPq/FDMGwbjmfbfYpygUuHdiieSAa4YgV8IzM9kz/hlP6cboE=; c=relaxed/relaxed; s=default; d=stu.pku.edu.cn; v=1;
	bh=+a0CHRD6JUHv/Q6MuVtpk9pZnMpyfYJrPtLR9cp9Cfk=;
	h=date:mime-version:subject:message-id:from;

Hi Lorenzo,

This does not appear to have been picked up -- torvalds/master still carries
the typo as of 238650ef6c7c.

I ran into it while auditing a Rust driver port, and can add a couple of data
points that may help judge whether it is worth taking:

  - rust/bindings/bindings_helper.h is architecture independent, so this is
    not specific to one configuration or architecture: both the arm64 and the
    x86 bindings publish the wrong value.

  - It is observable end to end. bindings_generated.rs contains

        pub const VM_MAYSHARE: vm_flags_t = 64;

    which is VM_MAYEXEC (bit 6), while include/linux/mm.h has
    DECLARE_VMA_BIT(MAYSHARE, 7), i.e. 128. Asking the C compiler directly,
    with a driver's own flags, returns VM_MAYSHARE == 128 as well. So any Rust
    code reading bindings::VM_MAYSHARE silently gets VM_MAYEXEC instead.

Since the fix already has three Reviewed-by tags, I assume it just fell
through the cracks. Would a resend help? I am happy to send one -- I just did
not want to post a duplicate of your patch without checking with you first.

Thanks,
Chunfeng
