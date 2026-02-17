Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C93563E5
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338528; cv=none; b=DmRVOhRgU2FxCeBxaPu7AVwLrvlXD39W/a0f4VcNkLD6ZgW+tExzMTNJExfPrSYJ5NyHOXB5KrJqZXikkcm9M0YrzvI75ngrkwK5C82YaiYRvM78mQ4yKhsddyWk4CzJ4Dllq992QMGIuH0uVVCUxmKkvFVEBqZUSLR6IlEoAWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338528; c=relaxed/simple;
	bh=cYUs2auc6C0kBTkFHq1FeokAWnj17fVT6B2TpqeQr7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cv1Qu0b0/bEwKPHM1ANCYYENvVsxcwDCc1ELiXyZlkoMsaNdQocA5svH9e1UieLBY4Jpkn/svdd6snw+G0IFz7BhQacobJMPWJNvEC7bXCt5uEX6TNEuqgzHQO6hb1I8G86H9qAdFiZWISxQCOQk0ujxWTRm5RRpocHOOZ+ASck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuMk24za; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuMk24za"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080D7C4CEF7;
	Tue, 17 Feb 2026 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771338528;
	bh=cYUs2auc6C0kBTkFHq1FeokAWnj17fVT6B2TpqeQr7k=;
	h=Date:From:To:Cc:Subject:From;
	b=RuMk24zaAcqDwru/HUUW+6TSzAdx7swBdMy/utqMtqqbdhhwJqRvuoyqseacdXfoU
	 Dyi7yE6btONYnJt2F/y4KN4Wyo6130aozcR5OMIPpB1mT0hxIbpCz1pQesUmyHYNvD
	 nO6sODi7Qf6oID8ZVrVj3Bd3BkcYPZdOx0RggoRKVTMSAgipFyUQ/q3099L1m2UJTJ
	 zhBdBAaCPW2SbBms5qkXUt69IvGeO1k/OznpnapkVjoma1gTl37ZnarzluOA7PPnc1
	 nj4dqU2V64AX26ygFj7KC24BQ9ulUXErtVrzZdBYuPVHYc0qGkn7N+DuGcAoPoIayq
	 VIFtoCGDsOKHw==
Date: Tue, 17 Feb 2026 15:28:45 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: linux-mm@kvack.org, lsf-pc@lists.linux-foundation.org
Cc: Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Daniel Gomez <da.gomez@samsung.com>, gost.dev@samsung.com, 
	Greg KH <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, 
	Kairui Song <kasong@tencent.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>
Subject: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
Message-ID: <aZRncP-sKLLS2K1U@macos>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We propose a topic to discuss the potential use of Rust in core Linux
kernel data structures.

The XArray unified the kernel's radix trees into one API back in v4.20
(2018). It sits under the page cache, block layer, filesystems, GPU
drivers, and dozens of other subsystems.

We looked at XArray bugs since 2018. About half are the usual suspects:
races, resource leaks, encoding and overflow mistakes. The kind of bugs
Greg says make up 60-80% of kernel security bugs [1]. Most of the rest
are complex logic bugs where Rust's type system may help but cannot
eliminate entirely.

The motivation for our interest in evaluating Rust for use in the XArray
started with a bug in mm/filemap.c that corrupted page cache data [2].
Consumer code called xa_get_order() without the lock, the tree changed,
and pages from wrong files ended up in the cache. No CVE was assigned
to this issue*, and no reproducer outside production existed before the
fix (a synthetic reproducer was only created [5][6] after the issue was
escalated). Kairui Song's refactoring and optimization patches [7][8][9]
happened to eliminate the issue.

In Rust, xa_get_order() would be a method on the lock guard. XArray
users would not be able to call it without holding the lock because
the type system would not let them. That does not help with the complex
logic bugs, but it eliminates the class of mistakes where the API is
used outside its required context.

We have a Rust XArray prototype that implements core operations designed
around Rust's ownership model. By the conference we aim to benchmark
it against tools/testing/radix-tree/ and use it to back the Rust null
block driver for A/B testing performance against the C implementation.
In the longer term, we plan to deploy the Rust implementation in the
page cache for A/B testing performance of generic workloads. We invite
the community to take a look at the code (when published), which at the
moment is rather simple as it only covers the core operations.

We know that Rust is not magic. The first kernel Rust CVE was a race
in an unsafe block where the safety comment was wrong [10]. However, we
believe that constraining potential memory safety issues to small unsafe
blocks provides a significant advantage over writing in C, where the
entire program text is to be considered one big unsafe block.

With Rust now part of the kernel's core infrastructure [11], we would
like to explore whether Rust is applicable for use in core MM data
structures. We invite the community to this exploration and we would
like to start the discussion. Specifically, we seek insights into:

 - Which workloads set the performance bar?
 - Would a type-safe API reduce consumer bugs, or would they just move
elsewhere?
 - Would rewriting core data structures introduce new, previously
unseen, bugs**?

*Under the Linux kernel CNA's CVE assignment policy, data corruption
issues do not meet the cve.org definition of a vulnerability and are
therefore not eligible for CVE assignment [3][4].

**Our thought: The existing test suite covers years of real edge cases.
A second implementation running against it is not just a rewrite, it is
differential testing.

Link: https://osskorea2025.sched.com/event/296sD/keynote-rust-in-the-linux-kernel-why-greg-kroah-hartman-linux-kernel-maintainer-and-fellow-the-linux-foundation [1]
Link: https://lore.kernel.org/all/A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io [2]
Link: https://www.cve.org/ResourcesSupport/Glossary#glossaryVulnerability [3]
Link: http://www.kroah.com/log/blog/2026/02/16/linux-cve-assignment-process [4]
Link: https://lore.kernel.org/all/d4a1cca4-96b8-4692-81f0-81c512f55ccf@meta.com [5]
Link: https://lore.kernel.org/all/5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk [6]
Link: https://git.kernel.org/torvalds/c/de60fd8ddeda2 [7]
Link: https://git.kernel.org/torvalds/c/a4864671ca0bf [8]
Link: https://git.kernel.org/torvalds/c/6758c1128ceb4 [9]
Link: https://lore.kernel.org/all/2025121614-CVE-2025-68260-558d@gregkh [10]
Link: https://lore.kernel.org/all/20251213000042.23072-1-ojeda@kernel.org [11]
