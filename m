Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E013E2745;
	Tue,  5 May 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987565; cv=none; b=R+P1CRinxEcsqh4QCbSX8DRmb2S8HO04SFRutgKTB9OsNThKnjHqKy9gFyX7NbB9BT29UceD2lIzrDAwAeCI7fsHI2pduANJYCiLLSaBb3sbX5vVEGyhDVQP91dXIyAZl0SJBH6H6FfS6+hyMRGaAzgFnm3NdOkagEuEZK/wQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987565; c=relaxed/simple;
	bh=8ukYUfqBteC0tA7Hsnbxww72TPgCbs515B4TXfAJV0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PVS+ktE7SUEV/ChGgrJJ8IzVzVKbgLZdBod21+lweR7Qf0ecf8/atGBBlVurO387NOgMQifn83qtglaahXdTapQZlp9zaqesEwxeZcUEuzfd6wBZkNDXJcyC9/4yusoe9+tWbEUuaAES+2RTRMUiz92+UiYRcGZ2cO9CKyHb86M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQLn4uim; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQLn4uim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8078EC2BCC7;
	Tue,  5 May 2026 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987564;
	bh=8ukYUfqBteC0tA7Hsnbxww72TPgCbs515B4TXfAJV0I=;
	h=From:To:Cc:Subject:Date:From;
	b=PQLn4uimX2LidkztfiM9I5lq2K/6NOjndRenvV7JOYZlhUktrRf+xGwFQuturjw0O
	 2a3Lhm4os1KmqcUoFwVKGsC+uGEr5sbi1O4etfXBK/NCFo3OlMxrVULpz8K1iCEb5K
	 px/udQVhNkUKRbm3xfpcS9JDFEBDOy2QFFsNO/OnIllomsfj69Zq5DFKQnoNeg56i4
	 n0I5OKM4O1HOUc1J9toMPJHe/eDEpgV2e06+L/DLC0IHU7i2DWTAyCfKuTMbIbIq0z
	 Yz7N/uN6j7dwBS7tfiymlUqYrnYi4KuEp8+Dte6i2HcUuSoV0Yljlcoq1pCmpx1rFb
	 1NJMyUmA6TqmA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFmk-00000004ic8-2aER;
	Tue, 05 May 2026 15:26:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Joe Perches <joe@perches.com>,
	Matteo Croce <technoboy85@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v2 00/11] Improve process/maintainers output
Date: Tue,  5 May 2026 15:25:47 +0200
Message-ID: <cover.1777987027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This series improve the output at process/maintainers: instead of a
pure enriched text, the maintainer's file content is now converted
to a table, and has gained a javascript to allow filtering entries.

The initial patches change the logic to split parsing from
output generation. Then, everything is stored into a dict at
the parsing phase, and ona header description variable.

This way, it is easier to adjust the output handler to produce
a more structured document. Right now, the entries are sorted
alphabetically, per subsystem's name(*).

(*) Currently, MAINTAINERS file has several entries not sorted.
    One has to run:

	 scripts/parse-maintainers.pl --input MAINTAINERS --output MAINTAINERS.new

    to sort it.

-

v2:
  - now, entries are sorted internally, instead of trusting that
    MAINTAINERS is already sorted;
  - file fields inside the description are now showing as literals;
  - Added a change in MAINTAINERS for rust-init profile;
  - Make it clearer at MAINTAINERS description that "P" expects
    a rst file;
  - fixed several bugs related to using or not O=DOCS.

Mauro Carvalho Chehab (11):
  docs: maintainers_include: keep hidden TOC sorted
  docs: maintainers_include: split state machine on multiple funcs
  docs: maintainers_include: cleanup the code
  docs: maintainers_include: clean most SPHINXDIRS=process warnings
  docs: maintainers_include: do some coding style cleanups
  docs: maintainers_include: store maintainers entries on a dict
  docs: maintainers_include: properly handle file patterns
  docs: maintainers_include: add a filtering javascript
  docs: maintainers_include: don't ignore invalid profile entries
  MAINTAINERS: make clearer about what's expected for "P" field
  MAINTAINERS: use a URL for pin-init maintainer's profile entry

 Documentation/sphinx/maintainers_include.py | 414 ++++++++++++--------
 MAINTAINERS                                 |   4 +-
 rust/pin-init/CONTRIBUTING.md               |  72 ----
 3 files changed, 256 insertions(+), 234 deletions(-)
 delete mode 100644 rust/pin-init/CONTRIBUTING.md

-- 
2.54.0

