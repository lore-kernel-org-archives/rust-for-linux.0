Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DC2C11E2;
	Mon, 22 Dec 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409429; cv=pass; b=E9GQCOzhm1LO2Ne/YCzfXmQU2MX4ArSozh+hZziMJXdVHWVCmX762iIYi/ATsT6JzxbzoIa/yNRUg4JMH8WXnRi91AJ2nYtNNG4Lp7UwIpY3dcSNsLkMsi99sth8rEmJk0UmfdtkjCbNHb/aXYTcGE12GjTS/GUyfHZYMdCc9KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409429; c=relaxed/simple;
	bh=/CFHnZRv8iJQS4gN/AvftpVO5uZjHr6Jv6/flQ2LNSM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VryGcDmWGP0dTkcE6b7tW/+yBuqgjYLjFPKpAet9rndz4GzI/BtJqVoOz8eb1sts3GNmOCriy5/M8CZfEGL3zTHSJaL1mtr59Wxcqu0+RZxU4ci6G24EL2lM/7TSkbbuu5z1P4oqqu8tCR/9nKjHg1IUk3kSbH+8dEnuWc1w+Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fbYpEacx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fbYpEacx"
ARC-Seal: i=1; a=rsa-sha256; t=1766409407; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=grVsiWrLKSsZ7++9wTG28PzeI59aKiC/nf0KNZSkZ+m89R3SZYK6Jq8fkn1+vNVJtBzFKVJyNJ6QdtVKjWaOsVcGvFObgIzY3NcX1agwvXmswo1D8fvRUqVoTSAvD4ZIXyyjZDsXADVCs+KvyTZQrpAXE5gULQiZdEiQ3fMQR/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766409407; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kbpbxml/MOu/aVBScrUPOfSS8Lzk/nvoyTNytxtJfjE=; 
	b=ncD5s2XGpNoyDYNPJfZNC5x8Lo7hljrLTV72l/50t9EGvyKaSIvThQtFQlD2yzUWOee32QoIUWMimNmUIWoBzQcm7fKS55qD7+F+LPw5+lkpDDifpWkEbjsRfwFssOAoAVYtqy9cTq5VjAArnV/rt/tiF8L6natpVspr61T2NSU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766409407;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Kbpbxml/MOu/aVBScrUPOfSS8Lzk/nvoyTNytxtJfjE=;
	b=fbYpEacxYVn5SQPgj4v004IRx3Y3eQY2LEvCizr9GwNA0ZX3ls7g6nEm6QkF6JOP
	icq9ch17hQ3hmz8AnO5QikFfcwAfbmtmQ2ddiLFr/HJoVTNguHUvHGCf5frO6RAfMYy
	haGIg+C1Wj/8RCE57o2L/+vFf+qI2Tici5E34WWI=
Received: by mx.zohomail.com with SMTPS id 17664094062896.333037342333114;
	Mon, 22 Dec 2025 05:16:46 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 0/7] driver-core: rust: replace `kernel::c_str!` with
 C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
Date: Mon, 22 Dec 2025 10:16:30 -0300
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <332B4589-762C-4881-B3B4-6378FB92230C@collabora.com>
References: <20251222-cstr-driver-core-v1-0-1142a177d0fd@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 22 Dec 2025, at 09:35, Tamir Duberstein <tamird@kernel.org> wrote:
> 
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (7):
>      rust: auxiliary: replace `kernel::c_str!` with C-Strings
>      rust: device: replace `kernel::c_str!` with C-Strings
>      rust: platform: replace `kernel::c_str!` with C-Strings
>      rust: io: replace `kernel::c_str!` with C-Strings
>      rust: irq: replace `kernel::c_str!` with C-Strings
>      rust: debugfs: replace `kernel::c_str!` with C-Strings
>      samples: rust: debugfs: replace `kernel::c_str!` with C-Strings
> 
> rust/kernel/debugfs.rs                | 23 +++++++++--------------
> rust/kernel/device.rs                 |  4 +---
> rust/kernel/device/property.rs        |  6 +++---
> rust/kernel/io/mem.rs                 |  7 +++----
> rust/kernel/irq/request.rs            |  6 ++----
> rust/kernel/platform.rs               |  6 +++---
> samples/rust/rust_debugfs.rs          | 17 ++++++++---------
> samples/rust/rust_debugfs_scoped.rs   | 20 ++++++++------------
> samples/rust/rust_driver_auxiliary.rs |  4 ++--
> samples/rust/rust_driver_faux.rs      |  4 ++--
> samples/rust/rust_driver_platform.rs  | 30 ++++++++++++++----------------
> 11 files changed, 55 insertions(+), 72 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-driver-core-8bf66543f532
> 
> Best regards,
> --  
> Tamir Duberstein <tamird@gmail.com>
> 

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
