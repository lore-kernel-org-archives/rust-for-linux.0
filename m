Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D337B409;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309813; cv=none; b=GSkFraWDHOJRCym3Ul7CxB4/VfFbaNi6oHJrm635cNTS7W5qI5cXIcXvvk+YPiuJfPofqUzIrYFhoUt9Ogaah+8KR6m1bp+d2NP9+5mop/lEhEiV4AyU2qfU6G3c/hzFSVkFzvzudrDl7CaIBoq+4rJCQ/SRGNJYTjlq3sIX37c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309813; c=relaxed/simple;
	bh=xzBTelskQ422LIU+Nxl34a49fgjI/8vjJLK7P1doRVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FnKI8awDqeymv3ygiSSpOFsvDfYzzgx4MjH2sNC8wnV0ugShRLqr1tTG0lbk8QiaD0aJFyTh9/tqxM63vF2JSuyXEWtasGBlRvZ4z+zqpQ/0VM8tQ478sa8eYJy1S2TSsl8YCqqRFrjjPzdtt+D/WyaaENK6wD8fUd74MH9SdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClUXLCQD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClUXLCQD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876C4C2BCC4;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=xzBTelskQ422LIU+Nxl34a49fgjI/8vjJLK7P1doRVk=;
	h=From:To:Cc:Subject:Date:From;
	b=ClUXLCQDiscJFQdTA8+bV+hIT2He1fCIYews9gmHZo91UzYUJ0lZu/UZou42Ark1K
	 /Ky0CvkP5wQ5rk7AcedxnMdgQmp+JDVMenFIyCSGzInR25i6CgYW+eLSWACKpmH4Ej
	 2gdn5TzRRRQcJUA6DNZCamgqZ5lvMf43CsZzO14O10ISeWpTuQUiU9Ia24lwA1+blr
	 DafjS+rIdpC5hYxPU0QhIEjqWaQRIWfEUz6XAWbPMEN4uVbf8Sb7wozNnb5x+AI7Um
	 QCu253+50ltDtlT3U3HxMTDGxsYyWBV9KzqMceFcMQcinbDH3AA/Iw+wI1q9SCdePA
	 74NWnUZVCemgw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GIY-22Zu;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
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
	Benno Lossin <lossin@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Joe Perches <joe@perches.com>,
	Matteo Croce <technoboy85@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v3 00/13] Improve process/maintainers output
Date: Sat,  9 May 2026 08:56:33 +0200
Message-ID: <cover.1778309595.git.mchehab+huawei@kernel.org>
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

v3:
  - don't remove rust/pin-init/CONTRIBUTING.md;
  - added two extra patches due to sashiko-bot feedback, to better
    handle wildcards and paths;
  - fixed some issues related with O=DIRS;

v2:
  - now, entries are sorted internally, instead of trusting that
    MAINTAINERS is already sorted;
  - file fields inside the description are now showing as literals;
  - Added a change in MAINTAINERS for rust-init profile;
  - Make it clearer at MAINTAINERS description that "P" expects
    a rst file;
  - fixed several bugs related to using or not O=DOCS.



Mauro Carvalho Chehab (13):
  docs: maintainers_include: keep hidden TOC sorted
  docs: maintainers_include: split state machine on multiple funcs
  docs: maintainers_include: cleanup the code
  docs: maintainers_include: clean most SPHINXDIRS=process warnings
  docs: maintainers_include: do some coding style cleanups
  docs: maintainers_include: store maintainers entries on a dict
  docs: maintainers_include: properly handle file patterns
  docs: maintainers_include: add a filtering javascript
  docs: maintainers_include: don't ignore invalid profile entries
  docs: maintainers_include: better handle directories
  docs: maintainers_include: better handle doc wildcards
  MAINTAINERS: make clearer about what's expected for "P" field
  MAINTAINERS: use a URL for pin-init maintainer's profile entry

 Documentation/sphinx/maintainers_include.py | 478 ++++++++++++--------
 MAINTAINERS                                 |   8 +-
 2 files changed, 294 insertions(+), 192 deletions(-)

-- 
2.54.0

