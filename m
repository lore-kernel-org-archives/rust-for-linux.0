Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995321;
	b=F2CDwp/SkRmdtylwo8VOgsBmR1jORJCNwXjFdxyRm61ldqwh55/tegBF28ridsqZ30uB
	 ChfmPSkoIF63HWUPlFAnWFOkfHYfGmreqUCXC1+epgf+wx3b89pRNt1rewfDs5C4ZzHPQ
	 w0wWCT9Aj2kj/DWnOSMoHmVt1c5Vr7vF7p9TTvKQqbD0rQv7972uuFaGUcbokTq9NiJoT
	 N/smUyVSyib6qIdglmbzmfDAIqUSQVDwiXNeLN4aSvyNJXbryGMol2T9WJnxFLBa0YlBG
	 EEfO2LanqTduKOdJOqVKgY5qQ8I/fey9nn+OWFnfVzDzPhf/XdEqg7uckaffQh2jGnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995321;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=z0TjN5X96/3TSYg1Kkre8QbeVo/rVvC6E1ckkOX4t0Q=;
	b=wN4yjQVduVq3WlfV6SgaOc8WLRrdP/+zbDabhvnTsobhkaZQ8V6g3fSIIDrVEanyuHDS
	 kJZN/257lkznzaUvXWR4DQIR9Hmh9cnAZT45FmMFYbStsVrT/4Z0HBuMBnRf0qqpAuwaK
	 X7dZEtOlYP9KMLIeqbOjnngNj1NGXCiuTxTpZwoNlRXaa3pVFeC9TtZRx6+92WR0NGlGj
	 EpEpfc5CGl/xhrMNKbR9g5tBQYsk5etxGGvbnCsmwbV0U+ZLVvCXxMezicRby0UIGlbMD
	 jPFA4QKQ+JrqbZaW++f8fnDVu5OVQmTpVCbUhHZdUeKdPhS1lzdyMh9xj9996kmj/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Rwrnr2fe;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE13606A31D;
	Mon, 26 Oct 2026 06:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE13606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Rwrnr2fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792995314; bh=z0TjN5X96/3TSYg1Kkre8QbeVo/rVvC6E1ckkOX4t0Q=;
	h=From:To:Cc:Subject:Date;
	b=Rwrnr2feItYmg5VbqmvFZLddhZm9CEuAFI0cOqkwDfgTS9SFOZV7Jt/Hzkg56bb7O
	 nhBghf/rYeHY32ADnw1CNUyrkEJNc7PC9JdtvK76RcUYvYebJ76h9ZTnJ1qbYmI0XU
	 gpFq4rVeJiuchaqPyw0KCjMe3wew3eUTxns2o4wA=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3CC94AE4; Mon, 26 Oct 2026 14:15:12 +0800
X-QQ-mid: xmsmtpt1792995312trs5vrkd8
Message-ID: <tencent_58EE6FD2C02C00F2884D18B81C620B130508@qq.com>
X-QQ-XMAILINFO: MVhBsdG5jI6h6FndQ4mnwtZUrH4dQN3iA6uZOu42+mrr0Tq6La0fEJB8h4QMvC
	 lU1ctN/d+yXwgDngu4cK8+FcaP2NNxSzmpCDtsAnB+OK5kEUkwuL0nCQQhSkpB4BX228v6kpJ21Z
	 UBWpO/eDjt3Vl8kbekEF3uy6c87yien2SIt9rEW9CPNYP/YtljstHkhVyugCGmqZ2AbyrYooM3sJ
	 y1f0rIFO3fIoRWS/cgUYmfLwiaZ7aewOt9V/KasZy/tuw2daEWwB0WENCLeK5CGFrknOgJexGPij
	 oon+xDA+Z7KxuepAb9Cr/xiWZgn3GxkFGnCp+FmqxOfNASu89mBmBmRf6oFu/NWQEKHcqhZ2lwux
	 goHWSAW4M40FNUNNou6T9U5OezBZ99e82freWeYF2cpEH53SOQNIN1O8qC8WkwEhwM/1NZNpAfFV
	 zzNXmZEbyh8a8XUwISrqBUEk2r8vkTdnkDteOKCMG9btPtwheUrpAB/k0hmJ8RacKU5QqcNVc7JO
	 5jMGzX4BdRZPZ6omRA0SZF7AUEXVfGW4DAlzGEun2RC4D1xpQdwJ/h5YNQC2RwQZ/GewPdXfzCsd
	 OeZurPZBe/a/Xrl39FecGDolH4/cChQgUS3td2sEub2Cwk+IuQCgMyDnEVux6jtwcpHk1fDtHMle
	 ksRcoNoqU+Uq06A1AeOItlBrEI1gWfVanwQ3YlCiJ+TF7Mnui23SStII9jFY9w/6suQ39Hb1+e8d
	 JwVJolZknhVZ05dXO2UaYrOm/Ff8WqZ6Yd/z9K+3iRnPVr99mHks4gNULkQFVEhMhnP/xpaW0drn
	 KhEI3nihDCXE3Oh7/Vt43iF/dZexcBjG/6b73Wb5yrHyFJge3DBga1F86XPPZ25Y/ZhJ6euuQ30d
	 MRixqe4ZQVWlWCd5eMtlw0il34oMzEdN5w8CdvX4OXcdgbFuED3Lrmph/phf6Wouh6TTqhvlrapK
	 Us6SX8iR1b3NELhjbshfnP3ZAx4JSNlbLssQiQXruzi1oLnrUdWbeYKeBDB3uMvpm8DvuspxHzdc
	 lG/M2vmtGQveaksle/zd7cmMLQDJnopzo8rnz5UrD2pZI08fqxmPhn1zGbeztw3QJepQjGRgWeTn
	 8eAtfR
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Shuai Liu <847807867@qq.com>
To: spi-devel-general@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: broonie@kernel.org,
	ojeda@kernel.org,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH 0/3] Rust abstractions for the SPI driver subsystem
Date: Mon, 26 Oct 2026 14:15:09 +0800
X-OQ-MSGID: <20261026061512.4180202-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust abstractions for several buses are already present in the
kernel (PCI, platform, I2C, USB, serdev, ...), but the SPI driver
subsystem is still missing such abstractions. This series adds them,
along with a sample driver demonstrating their usage.

To my knowledge, nobody is currently working on Rust SPI abstractions;
if someone already has work in progress, please let me know and I will
happily drop or rebase this series.

The abstractions follow the same layout as the existing I2C and serdev
abstractions: a `Driver` trait for drivers to implement, an `Adapter`
for driver registration, and a `SpiDevice` wrapping `struct spi_device`.
This first installment provides synchronous `read`, `write` and
`write_then_read` operations; message-based transfers (`spi_message` /
`spi_transfer`) can be added on top in a follow-up series.

One deviation from the I2C abstractions: `spi_match_id()` is not
exported to modules, so device id matching by modalias uses the
exported `spi_get_device_id()` instead, falling back to the OF and ACPI
tables.

The series is based on the current mainline tree (7.4 merge window) and
has been build-tested with CONFIG_RUST=y, including the KUnit tests and
doctests for the new abstractions. I do not have access to real SPI
hardware to run-test this series, but the included sample driver can be
used for that purpose.

Signed-off-by: Shuai Liu <847807867@qq.com>

Shuai Liu (3):
  rust: helpers: add SPI helpers
  rust: spi: add SPI driver abstractions
  samples: rust: add SPI driver sample

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/spi.c              |  21 ++
 rust/kernel/Kconfig.test        |  11 +
 rust/kernel/lib.rs              |   1 +
 rust/kernel/spi.rs              | 529 ++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_driver_spi.rs |  66 ++++
 9 files changed, 642 insertions(+)
 create mode 100644 rust/helpers/spi.c
 create mode 100644 rust/kernel/spi.rs
 create mode 100644 samples/rust/rust_driver_spi.rs

-- 
2.43.0

